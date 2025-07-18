import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:skyfi_sdk/utilities/modal.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import '../core/constants/colors.dart';
import '../core/constants/spacing.dart';
import '../core/constants/text_styles.dart';

class WebViewPopup extends HookWidget {
  final String url;
  final String? title;
  final bool isCheckbox;
  final VoidCallback? onAccepted;
  final VoidCallback? onClosed;

  const WebViewPopup({
    super.key,
    required this.url,
    this.title,
    this.isCheckbox = false,
    this.onAccepted,
    this.onClosed,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(true);
    final controller = useState<WebViewControllerPlus?>(null);
    final checkbox = useState(false);

    onCheckboxChanged(bool? value) {
      if (value == true) {
        checkbox.value = true;
      } else {
        checkbox.value = false;
        Modal.showConfirmation(
          title: 'Thông báo',
          showBothButtons: false,
          message: 'Đây là điều kiện bắt buộc để sử dụng dịch vụ của SkyFi.',
          onConfirm: () {
            checkbox.value = true;
          },
        );
      }
    }

    void onClose() {
      if (onClosed != null) {
        onClosed!();
      }
      Navigator.of(context).pop();
    }

    void onAccept() {
      if (isCheckbox && !checkbox.value) {
        Modal.showInfo(
          title: 'Thông báo',
          message: 'Vui lòng đồng ý với các điều khoản và điều kiện.',
        );
        return;
      }

      if (onAccepted != null) {
        onAccepted!();
      }
      Navigator.of(context).pop(true);
    }

    useEffect(() {
      Future<void> initWebView() async {
        try {
          final webViewController = WebViewControllerPlus();
          await webViewController
              .setJavaScriptMode(JavaScriptMode.unrestricted);
          await webViewController.setBackgroundColor(Colors.white);

          // Set user agent to ensure proper mobile rendering
          await webViewController.setUserAgent(
              'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1');

          await webViewController.setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (String url) {
                isLoading.value = true;
              },
              onPageFinished: (String url) async {
                isLoading.value = false;
                // Inject CSS to hide header and footer and ensure scrolling
                await webViewController.runJavaScript('''
                  var style = document.createElement('style');
                  style.innerHTML = `
                    header, .header, #header,
                    footer, .footer, #footer,
                    nav, .nav, #nav,
                    .navbar, #navbar,
                    .site-header, .site-footer,
                    .page-header, .page-footer {
                      display: none !important;
                    }
                    html {
                      overflow: auto !important;
                      height: 100% !important;
                    }
                    body {
                      padding: 0 !important;
                      margin: 0 !important;
                      overflow: auto !important;
                      height: 100% !important;
                      -webkit-overflow-scrolling: touch !important;
                      touch-action: auto !important;
                    }
                    * {
                      -webkit-overflow-scrolling: touch !important;
                      touch-action: auto !important;
                    }
                  `;
                  document.head.appendChild(style);

                  // Add viewport meta tag for proper mobile rendering
                  var viewport = document.querySelector('meta[name="viewport"]');
                  if (!viewport) {
                    viewport = document.createElement('meta');
                    viewport.name = 'viewport';
                    viewport.content = 'width=device-width, initial-scale=1.0, user-scalable=no';
                    document.head.appendChild(viewport);
                  }

                  // Function to hide elements
                  function hideHeaderFooter() {
                    const selectors = [
                      'header', '.header', '#header',
                      'footer', '.footer', '#footer',
                      'nav', '.nav', '#nav',
                      '.navbar', '#navbar',
                      '.site-header', '.site-footer',
                      '.page-header', '.page-footer'
                    ];

                    selectors.forEach(selector => {
                      const elements = document.querySelectorAll(selector);
                      elements.forEach(el => {
                        el.style.display = 'none';
                      });
                    });
                  }

                  // Hide immediately
                  hideHeaderFooter();

                  // Also hide after a short delay for dynamic content
                  setTimeout(hideHeaderFooter, 1000);
                  setTimeout(hideHeaderFooter, 3000);
                ''');
              },
              onWebResourceError: (WebResourceError error) {
                isLoading.value = false;
              },
            ),
          );
          await webViewController.loadRequest(Uri.parse(url));
          controller.value = webViewController;
        } catch (e) {
          isLoading.value = false;
        }
      }

      initWebView();
      return null;
    }, []);

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              border: Border(
                bottom: BorderSide(
                  color: AppColors.neutral200,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: AppColors.black),
                  onPressed: onClose,
                ),
                Expanded(
                  child: Text(
                    title ?? 'WebView',
                    style:
                        AppTextStyles.heading.copyWith(color: AppColors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 48), // Balance the close button
              ],
            ),
          ),

          // WebView Content
          Expanded(
            child: Stack(
              children: [
                if (controller.value != null)
                  WebViewWidget(
                    controller: controller.value!,
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                      Factory<VerticalDragGestureRecognizer>(
                        () => VerticalDragGestureRecognizer(),
                      ),
                    },
                  ),
                if (isLoading.value)
                  const Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.primary),
                    ),
                  ),
              ],
            ),
          ),

          // Bottom Section with Checkbox (if enabled)
          if (isCheckbox)
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border(
                  top: BorderSide(
                    color: AppColors.neutral200,
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: checkbox.value,
                        activeColor: AppColors.primary,
                        checkColor: AppColors.white,
                        onChanged: onCheckboxChanged,
                      ),
                      Expanded(
                        child: Text(
                          'Tôi đồng ý với các điều khoản và điều kiện của SkyFi',
                          style: AppTextStyles.body
                              .copyWith(color: AppColors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: onClose,
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.primary),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Hủy',
                            style: AppTextStyles.button.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onAccept,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Đồng ý',
                            style: AppTextStyles.button.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class WebViewModal {
  /// Show WebView in a bottom sheet modal
  static Future<bool?> show({
    required BuildContext context,
    required String url,
    String? title,
    bool isCheckbox = false,
    VoidCallback? onAccepted,
    VoidCallback? onClosed,
    bool isDismissible = true,
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return WebViewPopup(
          url: url,
          title: title,
          isCheckbox: isCheckbox,
          onAccepted: onAccepted,
          onClosed: onClosed,
        );
      },
    );
  }

  /// Show terms and conditions modal with checkbox
  static Future<bool?> showTermsAndConditions({
    required BuildContext context,
    String? termsUrl,
    String title = 'Điều khoản & Điều kiện',
    VoidCallback? onAccepted,
    VoidCallback? onClosed,
  }) {
    return show(
      context: context,
      url: termsUrl ?? 'https://skyfi.network/vi/terms-and-conditions?src=app',
      title: title,
      isCheckbox: true,
      onAccepted: onAccepted,
      onClosed: onClosed,
      isDismissible: false,
    );
  }

  /// Show any web content in modal
  static Future<bool?> showWebContent({
    required BuildContext context,
    required String url,
    required String title,
    VoidCallback? onClosed,
    bool isCheckbox = false,
  }) {
    return show(
      context: context,
      url: url,
      title: title,
      isCheckbox: isCheckbox,
      onClosed: onClosed,
    );
  }
}
