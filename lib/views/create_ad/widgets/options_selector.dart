import 'package:flutter/material.dart';

class OptionsSelector extends StatefulWidget {
  final List<String> options;

  const OptionsSelector({
    Key key,
    @required this.options,
  }) : super(key: key);
  @override
  _OptionsSelectorState createState() => _OptionsSelectorState();
}

class _OptionsSelectorState extends State<OptionsSelector> {
  List<bool> _selections = [true];

  @override
  void initState() {
    super.initState();
    var others = List.generate(widget.options.length - 1, (_) => false);
    _selections.addAll(others);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: ToggleButtons(
        borderRadius: BorderRadius.circular(5.0),
        children: widget.options.map((option) {
          return Container(
            margin: EdgeInsets.all(10.0),
            child: Text(
              option,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }).toList(),
        isSelected: _selections,
        onPressed: (int index) {
          setState(() {
            for (var i = 0; i < _selections.length; i++) {
              if (i == index) {
                _selections[i] = true;
              } else {
                _selections[i] = false;
              }
            }
          });
        },
        color: Colors.grey.withOpacity(0.6),
        selectedColor: Colors.black54,
        fillColor: Colors.grey.withOpacity(0.1),
        textStyle: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
