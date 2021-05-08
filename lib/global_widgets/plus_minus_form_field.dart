import 'package:flutter/material.dart';

class PlusMinusFormField extends StatefulWidget {
  final String title;
  final int initialValue;
  final TextEditingController controller;

  const PlusMinusFormField({
    Key key,
    @required this.title,
    this.controller,
    this.initialValue = 1,
  }) : super(key: key);
  @override
  _PlusMinusFormFieldState createState() => _PlusMinusFormFieldState();
}

class _PlusMinusFormFieldState extends State<PlusMinusFormField> {
  int _currentValue = 1;

  @override
  void initState() {
    _currentValue = widget.initialValue;
    super.initState();
  }

  add() {
    if (_currentValue < 15) {
      setState(() {
        _currentValue++;
      });
    }
  }

  minus() {
    if (_currentValue != 0) {
      setState(() {
        _currentValue--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          buttons()
        ],
      ),
    );
  }

  Widget buttons() {
    double size = 20.0;
    Color color =  Colors.black45;

    return Container(
      width: 120.0,
      height: 35.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: minus,
            icon: Icon(
              Icons.remove_circle_outline,
              color: color,
              size: size,
            ),
          ),
          Text(
            _currentValue.toString(),
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          IconButton(
            onPressed: add,
            icon: Icon(
              Icons.add_circle_outline,
              color:color,
              size: size
            ),
          ),
        ],
      ),
    );
  }
}
