import 'package:flutter/material.dart';
import '../../../themes/colors.dart';

class BaseInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? errorText;
  final bool isRequired;
  final Function(String)? onChanged;
  const BaseInput({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.isRequired = false,
    this.errorText,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'DM SansVN',
                  color: Color(0xFF040415),
                ),
              ),
              if (isRequired)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'DM SansVN',
                    color: Color(0xFFEA0029),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: errorText != null
                  ? const Color(0xFFEA0029)
                  : const Color(0xFFAEAEAE),
            ),
          ),
          child: TextField(
            controller: controller ?? null,
            onChanged: onChanged ?? null,
            obscureText: obscureText,
            keyboardType: keyboardType,
            style: const TextStyle(
              fontFamily: 'DM SansVN',
              fontSize: 16,
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primary500, width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: hint,
              hintStyle: const TextStyle(
                color: Color(0xFFB1B1B3),
                fontSize: 16,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 19,
                vertical: 10,
              ),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: const TextStyle(
              color: Color(0xFFEA0029),
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }
}
