import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pottel_sdk/core/constants/colors.dart';
import 'package:pottel_sdk/core/constants/text_styles.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.title,
    required this.iconPath,
    this.onTap,
    this.showDivider = true,
  });

  final String title;
  final String iconPath;
  final VoidCallback? onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                SvgPicture.asset(
                  iconPath,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    AppColors.text,
                    BlendMode.srcIn,
                  ),
                  package: 'pottel_sdk',
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.body,
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: AppColors.text,
                  size: 24,
                ),
              ],
            ),
          ),
          if (showDivider)
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.border,
            ),
        ],
      ),
    );
  }
}
