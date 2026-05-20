import 'package:flutter/material.dart';

class AppColors {
  // Primary - Golden Yellow #F4B31A
  static const Color primary = Color(0xFFF4B31A);
  // Primary tints
  static const Color primary80 = Color(0xFFF6C248); // 80% tint
  static const Color primary60 = Color(0xFFF8D176); // 60% tint
  static const Color primary40 = Color(0xFFFBE1A3); // 40% tint
  static const Color primary20 = Color(0xFFFDF0D1); // 20% tint

  // Deep Black #58595B
  static const Color deepBlack = Color(0xFF58595B);
  // Deep Black tints
  static const Color deepBlack80 = Color(0xFF797A7C); // 80% tint
  static const Color deepBlack60 = Color(0xFF9B9B9D); // 60% tint
  static const Color deepBlack40 = Color(0xFFBCBDBD); // 40% tint
  static const Color deepBlack20 = Color(0xFFDEDEDE); // 20% tint

  static const Color secondary = Color(0xFFF8D176);
  static const Color text = Color(0xFF333333);
  static const Color textGrey = Color(0xFF58595B);
  static const Color textLight = Color(0xFF9B9B9D);
  static const Color background = Color(0xFFF5F5F5);
  static const Color white = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFDEDEDE);
  static const Color red = Color(0xFFE4262B);
  static const Color blue = Color(0xFF2F74FF);
  static const Color black = Color(0xFF58595B);
  static const Color green = Color(0xFF00B141);
  static const Color placeholder = Color(0xFF9B9B9D);

  static const Color navHomeText = Color(0xFF9B9B9D);
  static const Color navHomeTextSelected = Color(0xFFF4B31A);

  static const Color strongSecondary = Color(0xFFC38F15);

  static const LinearGradient lightGradient = LinearGradient(
    colors: [white, white],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Color transparent = Colors.transparent;
  static const Color neutral0 = Color(0xFF58595B);
  static const Color neutral100 = Color(0xFFF2F2F2);
  static const Color neutral200 = Color(0xFFE6E6E6);
  static const Color neutral300 = Color(0xFFCCCCCC);
  static const Color neutral400 = Color(0xFF9B9B9D);
  static const Color neutral500 = Color(0xFF797A7C);
  static const Color neutral700 = Color(0xFF58595B);
  static const Color neutral800 = Color(0xFF3A3B3C);

  static LinearGradient disabledGradient = LinearGradient(
    colors: [Colors.grey.shade300, Colors.grey.shade300],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFF4B31A), Color(0xFFF6C248)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [
      Color(0x63FDF0D1), // primary 20% tint, 39% opacity
      Color(0x63FBE1A3), // primary 40% tint, 39% opacity
      Color(0x63F8D176), // primary 60% tint, 39% opacity
      Color(0x63F4B31A), // primary 100%, 39% opacity
    ],
    stops: [0.0, 0.333, 0.666, 1.0],
    begin: Alignment(-0.04, -0.14),
    end: Alignment(0.83, 1.14),
  );

  static const LinearGradient redGradient = LinearGradient(
    colors: [
      Color(0xFFF4B31A), // primary700 - dark gold
      Color(0xFFF4B31A), // primary - golden yellow
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
