import 'package:flutter/material.dart';
import '../global_widgets/button_group_button.dart';

class ButtonGroup extends StatefulWidget {
  final List<String> options;

  const ButtonGroup({
    Key key,
    @required this.options,
  }) : super(key: key);
  @override
  _ButtonGroupState createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Theme.of(context).primaryColor.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widget.options.map((option) {
          return ButtonGroupButton(option: option);
        }).toList(),
      ),
    );
  }
}
