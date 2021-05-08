import 'package:flutter/material.dart';

class ButtonGroupButton extends StatefulWidget {
  final String option;

  const ButtonGroupButton({Key key, this.option}) : super(key: key);
  @override
  _ButtonGroupButtonState createState() => _ButtonGroupButtonState();
}

class _ButtonGroupButtonState extends State<ButtonGroupButton> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: selected ? Theme.of(context).primaryColor : null,
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          selected = !selected;
        });
      },
      icon: Text(
        widget.option,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: selected ? Theme.of(context).primaryColor : Colors.grey.withOpacity(0.6),
          fontSize: 16.0,
        ),
      ),
    );
  }
}
