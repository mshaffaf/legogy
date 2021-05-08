import 'package:flutter/material.dart';

enum HeaderTextType { big, small }

class HeaderText extends StatelessWidget {
  final String text;
  final HeaderTextType type;

  const HeaderText({
    Key key,
    @required this.text,
    this.type = HeaderTextType.big,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final fontSize = this.type == HeaderTextType.big ? 30.0 : 15.0;
    final fontWeight = this.type == HeaderTextType.big ?  FontWeight.w900 :  FontWeight.w600;
    final color = this.type == HeaderTextType.big ?   Colors.black.withOpacity(0.7) :  Colors.grey.withOpacity(0.8);
    
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
