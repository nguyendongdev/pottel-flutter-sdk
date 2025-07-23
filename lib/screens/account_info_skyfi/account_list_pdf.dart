import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/text_styles.dart';
import 'package:skyfi_sdk/screens/account_info_skyfi/widgets/menu_item.dart';
import 'package:skyfi_sdk/themes/colors.dart' as AppColors;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ItemPdf {
  final String title;
  final String link;

  ItemPdf({
    required this.title,
    required this.link,
  });
}

void showPdfViewer(BuildContext context, String pdfUrl, {String? title}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title ?? 'PDF Viewer',
                    style: AppTextStyles.heading,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: SfPdfViewer.network(pdfUrl),
          ),
        ],
      ),
    ),
  );
}

class AccountListPDF extends HookConsumerWidget {
  const AccountListPDF(
      {super.key, required this.items, this.title = 'Danh sách PDF'});
  final List<ItemPdf> items;
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          title,
          style: AppTextStyles.heading,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: items.map((item) {
              return MenuItem(
                title: item.title,
                iconPath: 'assets/icons/file-edit.svg',
                onTap: () {
                  showPdfViewer(context, item.link, title: item.title);
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
