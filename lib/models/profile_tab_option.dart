import 'package:flutter/widgets.dart';

class ProfileTabOption {
  String name;
  String icon;
  double iconSize;
  Function onPressed;

  ProfileTabOption({
    @required this.name,
    @required this.icon,
    this.iconSize = 45.0,
    @required this.onPressed,
  });
}
