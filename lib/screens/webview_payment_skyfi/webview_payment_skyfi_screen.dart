import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/text_styles.dart';
import 'package:skyfi_sdk/core/widgets/gradient_button.dart';
import 'package:skyfi_sdk/routers/routers.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../payment_skyfi/provider/payment_order_provider.dart';

class WebviewPaymentSkyfiScreen extends HookConsumerWidget {
  const WebviewPaymentSkyfiScreen({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentOrderProvider);

    final isLoading = useState(true);
    final hasError = useState<bool?>(null);
    final isSuccess = useState(false);
    final errorMessage = useState<String?>(null);
    final controller = useState<WebViewControllerPlus?>(null);
    final orderId = useState<String?>(null);
    // final phone = useState<String?>(null);
    useEffect(() {
      Future<void> initWebView() async {
        try {
          final webViewController = WebViewControllerPlus();
          await webViewController
              .setJavaScriptMode(JavaScriptMode.unrestricted);
          await webViewController.setBackgroundColor(Colors.white);
          await webViewController.setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (String url) {
                isLoading.value = true;
                hasError.value = null;
              },
              onPageFinished: (String url) {
                isLoading.value = false;
              },
              onWebResourceError: (WebResourceError error) {
                // hasError.value = true;
                hasError.value = null;
                errorMessage.value = error.description;
                isLoading.value = false;
              },
              onUrlChange: (UrlChange urlChange) {
                print('onUrlChange: ${urlChange.url}');
                if (urlChange.url != null &&
                    urlChange.url!.contains('success')) {
                  // parse url
                  final url = Uri.parse(urlChange.url!);
                  final queryParams = url.queryParameters;
                  print('queryParams: $queryParams');
                  orderId.value = queryParams["orderId"];
                  isSuccess.value = true;
                }
                if (urlChange.url != null && urlChange.url!.contains('error')) {
                  // parse url
                  final url = Uri.parse(urlChange.url!);
                  final queryParams = url.queryParameters;
                  orderId.value = queryParams["orderId"];
                  isSuccess.value = false;
                  context.pushReplacementNamed(AppRouter.homeSkyFiNew);
                }

                // include cancel move to home
                if (urlChange.url != null &&
                    urlChange.url!.contains('cancel')) {
                  context.pushReplacementNamed(AppRouter.homeSkyFiNew);
                }

                print('urlChange -->: ${urlChange.url}');
              },
            ),
          );
          await webViewController.loadRequest(
            Uri.parse(url),
          );
          controller.value = webViewController;
        } catch (e) {
          // hasError.value = true;
          hasError.value = null;
          errorMessage.value = e.toString();
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
          'Thanh toán',
          style: AppTextStyles.title.copyWith(
            color: AppColors.text,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            // check if isSuccess is true
            if (isSuccess.value) {
              context.pushNamed(AppRouter.orderDetailSkyfi,
                  extra: orderId.value);
            } else {
              Navigator.of(context).pop();
            }
            // Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          if (controller.value != null)
            WebViewWidget(controller: controller.value!),
          if (isLoading.value)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (hasError.value == true)
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
                          const TextSpan(
                            text: 'Đã xảy ra lỗi\n',
                            style: TextStyle(
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
                      child: const Text('Thử lại'),
                    ),
                  ],
                ),
              ),
            ),
          if (isSuccess.value)
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(children: [
                  Text(
                    'Thanh toán thành công',
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
                    package: 'skyfi_sdk',
                  ),
                  const SizedBox(height: 16),
                  Text('Mã đơn hàng: ${orderId.value}'),
                  const Spacer(),
                  // button Xem lại đơn hàng
                  GradientButton(
                    text: 'Xem đơn hàng',
                    height: 48,
                    onPressed: () {
                      // print('Xem đơn hàng id: ${orderId.value}');
                      context.pushNamed(AppRouter.orderDetailSkyfi,
                          extra: orderId.value);
                    },
                  ),
                  const SizedBox(height: AppSpacing.lg),
                ]),
              ),
            ),
        ],
      ),
    );
  }
}
