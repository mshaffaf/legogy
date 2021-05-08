import 'package:flutter/material.dart';

class PropertyTypeRow extends StatelessWidget {
  final Widget typeCard1;
  final Widget typeCard2;

  const PropertyTypeRow({
    Key key,
    @required this.typeCard1,
    @required this.typeCard2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Expanded(child: typeCard1),
          Expanded(child: typeCard2),
        ]
      ),
    );
  }
}
