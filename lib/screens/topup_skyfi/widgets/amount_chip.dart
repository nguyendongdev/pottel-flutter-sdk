import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';

class AmountChip extends StatelessWidget {
  const AmountChip({
    super.key,
    required this.amount,
    required this.isSelected,
    required this.onTap,
  });

  final int amount;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###', 'vi_VN');

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFEF7E9) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                isSelected ? const Color(0xFFFFAA00) : const Color(0xFFDDDDDD),
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                '${formatter.format(amount)} VND',
                style: AppTextStyles.label.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isSelected ? AppColors.primary : AppColors.text,
                ),
              ),
            ),
            if (isSelected)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    'assets/icons/half-check.svg',
                    width: 24,
                    height: 24,
                    package: 'skyfi_sdk',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
