import 'package:flutter/material.dart';

import '../constants/colors.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 370,
          decoration: const BoxDecoration(
            gradient: AppColors.redGradient,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 370 - 128,
          decoration: const BoxDecoration(
            color: AppColors.background,
          ),
        ),
      ],
    );
  }
}
