import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const FormContainer({
    Key key,
    @required this.child,
    this.padding = const EdgeInsets.symmetric(vertical: 10.0)
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final br = BorderRadius.circular(12.0);
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: br,
        color: Colors.white,
      ),
      child: child,
    );
  }
}
