import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  // Tab
  static const tabBarTextStyle = const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w900,
  );

  // Form
  static const formLabelTextStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    color: CustomColors.formLabelTextColor,
  );

  static const textFieldTextStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    color: CustomColors.primaryDarkColor,
  );

  // Button
  static const btnTextStyle = const TextStyle(
    fontWeight: FontWeight.w800,
    color: Colors.black45,
  );

  static const btnInverseTextStyle = const TextStyle(
    fontWeight: FontWeight.w800,
    color: Colors.black,
  );

  static const headerTextTextStyle = const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w900,
    color: CustomColors.primaryDarkColor
  );
}
