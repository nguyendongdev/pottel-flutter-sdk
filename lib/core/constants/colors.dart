import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFF9A51A);
  static const Color secondary = Color(0xFFFFDD00);
  static const Color text = Color(0xFF333333);
  static const Color textGrey = Color(0xFF5C5C5C);
  static const Color textLight = Color(0xFFA1A1A1);
  static const Color background = Color(0xFFF5F5F5);
  static const Color white = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFDDDDDD);
  static const Color red = Color(0xFFE4262B);
  static const Color blue = Color(0xFF2F74FF);
  static const Color black = Color(0xFF181818);
  static const Color green = Color(0xFF00B141);
  static const Color placeholder = Color(0xFF757575);

  static const Color navHomeText = Color(0xFFA1A1A1);
  static const Color navHomeTextSelected = Color(0xFFE4262B);

  static const Color strongSecondary = Color(0xffCC8F14);

  static const LinearGradient lightGradient = LinearGradient(
    colors: [white, white],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Color transparent = Colors.transparent;
  static const Color neutral0 = Color(0xFF181818);
  static const Color neutral100 = Color(0xFFF2F2F2);
  static const Color neutral200 = Color(0xFFE6E6E6);
  static const Color neutral300 = Color(0xFFCCCCCC);
  static const Color neutral400 = Color(0xFF999999);
  static const Color neutral500 = Color(0xFF666666);
  static const Color neutral700 = Color(0xFF1F1F1F);
  static const Color neutral800 = Color(0xFF181818);

  static LinearGradient disabledGradient = LinearGradient(
    colors: [Colors.grey.shade300, Colors.grey.shade300],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFF9A51A), Color(0xFFFFDD00)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // static const LinearGradient primaryGradient = LinearGradient(
  //   colors: [Color(0xFFF9A51A), Color(0xFFF9A51A)],
  //   begin: Alignment.centerLeft,
  //   end: Alignment.centerRight,
  // );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [
      Color(0x63EACD1A), // 39% opacity
      Color(0x63FAA61A), // 39% opacity
      Color(0x63F24D27), // 39% opacity
      Color(0x63ED1B2F), // 39% opacity
    ],
    stops: [0.0, 0.588, 0.909, 1.0],
    begin: Alignment(-0.04, -0.14),
    end: Alignment(0.83, 1.14),
  );

  static const LinearGradient redGradient = LinearGradient(
    colors: [
      Color(0xFF811A19), // 4.4% opacity
      Color(0xFFED1B2F), // 98.1% opacity
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
// background: linear-gradient(162.3deg, #811A19 4.4%, #ED1B2F 98.1%);
