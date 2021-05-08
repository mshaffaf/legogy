import 'package:flutter/material.dart';

class ContentView extends StatelessWidget {
  final String title;
  final Widget content;
  final EdgeInsetsGeometry padding;

  const ContentView({
    Key key,
    @required this.title,
    @required this.content,
    this.padding = const EdgeInsets.only(top: 20.0),
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
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 10.0),
          content,
        ],
      ),
    );
  }
}
