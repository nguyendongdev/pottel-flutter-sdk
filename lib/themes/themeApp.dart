import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData themeData = ThemeData(
  fontFamily: 'DM SansVN',
  appBarTheme: const AppBarTheme(centerTitle: true),
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple, primary: primary500, secondary: secondary),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(
      color: neutral400,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    disabledBorder: OutlineInputBorder(
        gapPadding: 0,
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(width: 1.5, color: neutral200)),
    errorStyle: const TextStyle(
      color: primary500,
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    focusedBorder: OutlineInputBorder(
        gapPadding: 0,
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(width: 1.5, color: neutral400)),
    border: OutlineInputBorder(
        gapPadding: 0,
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(width: 1, color: neutral400)),
  ),
  useMaterial3: true,
);
