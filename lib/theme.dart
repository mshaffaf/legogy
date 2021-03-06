import 'package:flutter/material.dart';
import 'utils/colors.dart';
import 'utils/utils.dart';

ThemeData buildThemeData() {
  final baseTheme = ThemeData(
    fontFamily: AppFonts.primaryFont,
    primarySwatch: Colors.blue
  );

  return baseTheme.copyWith(
    primaryColor: CustomColors.primaryColor,
    scaffoldBackgroundColor: CustomColors.scaffoldColor,
    appBarTheme: AppBarTheme(
      color: CustomColors.appBarColor,
      elevation: 0,
    ),
  );
}
