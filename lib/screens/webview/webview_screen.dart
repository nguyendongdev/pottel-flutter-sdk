import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import 'package:skyfi_sdk/l10n/localization_extension.dart';

class WebViewScreen extends HookWidget {
  final String url;
  final String? title;

  const WebViewScreen({
    super.key,
    required this.url,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(true);
    final controller = useState<WebViewControllerPlus?>(null);

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
              },
              onPageFinished: (String url) async {
                isLoading.value = false;
                // Inject CSS to hide header and footer
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
                    body {
                      padding-top: 0 !important;
                      margin-top: 0 !important;
                    }
                  `;
                  document.head.appendChild(style);

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

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          title ?? context.l10n.translate('webview_default_title'),
          style: AppTextStyles.heading.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          if (controller.value != null)
            WebViewWidget(
              controller: controller.value!,
            ),
          if (isLoading.value)
            const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
        ],
      ),
    );
  }
}
