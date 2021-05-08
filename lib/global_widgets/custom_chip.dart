import 'package:flutter/material.dart';

class CustomChip extends StatefulWidget {
  final String label;

  CustomChip({
    Key key,
    this.label,
  }) : super(key: key);

  @override
  _CustomChipState createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    Color color = selected ? Theme.of(context).primaryColor : Colors.grey;
    return OutlineButton(
      borderSide: BorderSide(
        color: color,
        style: BorderStyle.solid,
        width: 0.8,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      onPressed: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Text(
        widget.label,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}
