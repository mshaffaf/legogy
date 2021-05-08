import 'package:flutter/material.dart';

import 'custom_appbar.dart';
import 'header_text.dart';

class BaseView extends StatelessWidget {
  final String title;
  final Widget body;
  final EdgeInsetsGeometry padding;

  const BaseView({
    Key key,
    @required this.title,
    @required this.body,
    this.padding = const EdgeInsets.only(
      left: 20.0,
      right: 20.0,
      top: 40.0,
    ),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final top = Container(
      margin: EdgeInsets.only(bottom: 30.0),
      child: HeaderText(text: title),
    );

    final content = Expanded(child: body);

    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[top, content],
        ),
      ),
    );
  }
}
