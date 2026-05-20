import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pottel_sdk/core/constants/text_styles.dart';
import 'package:pottel_sdk/core/widgets/gradient_button.dart';
import 'package:pottel_sdk/l10n/localization_extension.dart';
import 'package:pottel_sdk/routers/routers.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../payment_skyfi/provider/payment_order_provider.dart';

class WebviewPaymentSkyfiScreen extends HookConsumerWidget {
  const WebviewPaymentSkyfiScreen({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(paymentOrderProvider);

    final isLoading = useState(true);
    final hasError = useState<bool>(false);
    final isSuccess = useState(false);
    final errorMessage = useState<String?>(null);
    final controller = useState<WebViewControllerPlus?>(null);
    final orderId = useState<String?>(null);
    final hasResolved = useState(false);

    String? orderCodeFromInitialUrl() {
      try {
        final uri = Uri.parse(url);
        return uri.queryParameters['ordercode'] ??
            uri.queryParameters['orderCode'] ??
            uri.queryParameters['orderId'] ??
            uri.queryParameters['order_id'] ??
            uri.queryParameters['order_number'];
      } catch (_) {
        return null;
      }
    }

    int? parseInt(dynamic value) {
      if (value == null) return null;
      if (value is int) return value;
      if (value is num) return value.toInt();
      return int.tryParse(value.toString());
    }

    String? resolveOrderId(Map<String, dynamic> payload) {
      return payload['orderCode']?.toString() ??
          payload['ordercode']?.toString() ??
          payload['orderId']?.toString() ??
          payload['order_id']?.toString() ??
          payload['order_number']?.toString() ??
          orderCodeFromInitialUrl();
    }

    bool isSuccessPayload(Map<String, dynamic> payload) {
      final responseCode = (payload['responseCode'] ?? '').toString();
      final paymentStatus = parseInt(payload['paymentStatus']);
      final status = (payload['status'] ?? '').toString().toLowerCase();

      return responseCode == '00' ||
          paymentStatus == 1 ||
          status == 'success' ||
          status == 'paid';
    }

    bool isCancelledPayload(Map<String, dynamic> payload) {
      final paymentStatus = parseInt(payload['paymentStatus']);
      final status = (payload['status'] ?? '').toString().toLowerCase();
      return paymentStatus == 0 || status == 'cancel' || status == 'cancelled';
    }

    void handlePaymentPayload(Map<String, dynamic> payload) {
      if (hasResolved.value) return;

      final resolvedOrderId = resolveOrderId(payload);
      if (resolvedOrderId != null && resolvedOrderId.isNotEmpty) {
        orderId.value = resolvedOrderId;
      }

      if (isSuccessPayload(payload)) {
        hasResolved.value = true;
        isSuccess.value = true;
        return;
      }

      if (isCancelledPayload(payload)) {
        hasResolved.value = true;
        if (context.mounted) {
          context.pushReplacementNamed(AppRouter.homeSkyFiNew);
        }
        return;
      }

      final hasFailureSignal = payload.containsKey('paymentStatus') ||
          payload.containsKey('responseCode') ||
          payload.containsKey('status') ||
          payload.containsKey('paymentCode') ||
          payload.containsKey('paymentMessage') ||
          payload.containsKey('message');

      if (hasFailureSignal) {
        hasResolved.value = true;
        if (context.mounted) {
          context.pushReplacementNamed(AppRouter.homeSkyFiNew);
        }
      }
    }

    void handleUrlSignal(String rawUrl) {
      final lower = rawUrl.toLowerCase();
      final uri = Uri.tryParse(rawUrl);
      final query = <String, dynamic>{};
      if (uri != null) {
        query.addAll(uri.queryParameters);
      }

      if (query.isNotEmpty) {
        handlePaymentPayload(query);
        return;
      }

      if (lower.contains('cancel')) {
        handlePaymentPayload({'status': 'cancel'});
        return;
      }

      if (lower.contains('success')) {
        handlePaymentPayload({'status': 'success'});
        return;
      }

      if (lower.contains('error') || lower.contains('failed')) {
        handlePaymentPayload({'status': 'failed'});
      }
    }

    useEffect(() {
      Future<void> initWebView() async {
        try {
          final webViewController = WebViewControllerPlus();
          await webViewController
              .setJavaScriptMode(JavaScriptMode.unrestricted);
          await webViewController.setBackgroundColor(Colors.white);

          webViewController.addJavaScriptChannel(
            'PaymentCallback',
            onMessageReceived: (message) {
              if (hasResolved.value) return;
              try {
                final raw = message.message;
                final decoded = jsonDecode(raw);
                if (decoded is Map<String, dynamic>) {
                  handlePaymentPayload(decoded);
                } else if (decoded is Map) {
                  handlePaymentPayload(Map<String, dynamic>.from(decoded));
                }
              } catch (_) {}
            },
          );

          await webViewController.setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (String currentUrl) {
                isLoading.value = true;
                hasError.value = false;
                handleUrlSignal(currentUrl);
              },
              onPageFinished: (String currentUrl) async {
                isLoading.value = false;
                handleUrlSignal(currentUrl);
                await webViewController.runJavaScript('''
                  if (window.__pottelPaymentBridgeInstalled !== true) {
                    window.__pottelPaymentBridgeInstalled = true;
                    window.paymentCallback = function(payload) {
                      try {
                        const message = typeof payload === 'string'
                          ? payload
                          : JSON.stringify(payload);
                        PaymentCallback.postMessage(message);
                      } catch (_) {}
                    };
                  }
                ''');
              },
              onWebResourceError: (WebResourceError error) {
                hasError.value = true;
                errorMessage.value = error.description;
                isLoading.value = false;
              },
              onUrlChange: (UrlChange urlChange) {
                final changedUrl = urlChange.url;
                if (changedUrl == null) return;
                handleUrlSignal(changedUrl);
              },
            ),
          );

          await webViewController.loadRequest(Uri.parse(url));
          controller.value = webViewController;
        } catch (e) {
          hasError.value = true;
          errorMessage.value = e.toString();
          isLoading.value = false;
        }
      }

      if (url.isNotEmpty) {
        initWebView();
      }
      return () {
        controller.value?.clearCache();
      };
    }, [url]);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        surfaceTintColor: AppColors.white,
        title: Text(
          context.l10n.translate('payment_title'),
          style: AppTextStyles.title.copyWith(
            color: AppColors.text,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (isSuccess.value) {
              context.pushNamed(AppRouter.orderDetailSkyfi,
                  extra: orderId.value);
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: Stack(
        children: [
          if (controller.value != null && !isSuccess.value)
            WebViewWidget(controller: controller.value!),
          if (isLoading.value)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (hasError.value)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    SelectableText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '${context.l10n.translate('payment_error_occurred')}\n',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: errorMessage.value,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        hasError.value = false;
                        controller.value?.reload();
                      },
                      child: Text(context.l10n.translate('retry_button')),
                    ),
                  ],
                ),
              ),
            ),
          if (isSuccess.value)
            Center(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.l10n.translate('payment_successful'),
                      style: AppTextStyles.title.copyWith(
                        color: AppColors.text,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Image.asset(
                      'assets/images/pay_success.png',
                      width: 110,
                      height: 110,
                      fit: BoxFit.contain,
                      package: 'pottel_sdk',
                    ),
                    const SizedBox(height: 16),
                    Text(
                      context.l10n
                          .translate('order_code_label')
                          .replaceFirst('{0}', orderId.value ?? ''),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    GradientButton(
                      text: context.l10n.translate('view_order'),
                      height: 48,
                      onPressed: () {
                        context.pushNamed(
                          AppRouter.orderDetailSkyfi,
                          extra: orderId.value,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
