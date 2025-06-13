import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const AppBarCustom({
    super.key,
    required this.title,
    this.onBack,
    this.actions,
    this.centerTitle = true,
    this.backgroundColor = AppColors.white,
    this.foregroundColor = AppColors.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: 0,
      centerTitle: centerTitle,
      title: Text(
        title,
        style: AppTextStyles.title.copyWith(
          color: foregroundColor,
        ),
      ),
      leading: onBack != null
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: onBack,
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
