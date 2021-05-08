import 'package:flutter/widgets.dart';

class AStep {
  final String title;
  final String subtitle;
  final Widget content;
  final String Function() validation;

  AStep({
    @required this.title,
    @required this.subtitle,
    @required this.content,
    @required this.validation
  });
}
