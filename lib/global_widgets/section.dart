import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String title;
  final Widget content;
  final EdgeInsetsGeometry padding;
  final FontWeight fontWeight;
  final double fontSize;

  const Section({
    Key key,
    @required this.title,
    @required this.content,
    this.padding = const EdgeInsets.only(bottom: 30.0),
    this.fontWeight = FontWeight.bold,
    this.fontSize = 20.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
          SizedBox(height: 10.0),
          content,
        ],
      ),
    );
  }
}
