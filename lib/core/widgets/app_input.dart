import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../constants/text_styles.dart';

class AppInput extends StatelessWidget {
  const AppInput(
      {super.key,
      required this.label,
      required this.hintText,
      this.isRequired = false,
      this.initialValue,
      required this.onChanged});
  final String label;
  final String hintText;
  final bool isRequired;
  final String? initialValue;
  final Null Function(dynamic value) onChanged;

  @override
  Widget build(BuildContext context) {
    return _buildInputField(
      label: label,
      hintText: hintText,
      isRequired: isRequired,
      initialValue: initialValue,
      onChanged: onChanged,
    );
  }
}

Widget _buildInputField({
  required String label,
  required String hintText,
  bool isRequired = false,
  String? initialValue,
  required Null Function(dynamic value) onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            label,
            style: AppTextStyles.small.copyWith(
              color: AppColors.text,
            ),
          ),
          if (isRequired)
            Text(
              '*',
              style: AppTextStyles.small.copyWith(
                color: AppColors.red,
              ),
            ),
        ],
      ),
      const SizedBox(height: AppSpacing.xs),
      Container(
        child: TextFormField(
          initialValue: initialValue,
          style: AppTextStyles.body,
          onChanged: onChanged,
          decoration: InputDecoration(
            focusColor: AppColors.primary,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
              borderRadius:
                  BorderRadius.all(Radius.circular(AppSpacing.buttonRadius)),
            ),
            hintText: hintText,
            hintStyle: AppTextStyles.body.copyWith(
              color: AppColors.textLight,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.xs,
            ),
          ),
        ),
      ),
    ],
  );
}
