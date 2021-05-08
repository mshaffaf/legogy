import 'package:flutter/material.dart';

class TypeCard extends StatelessWidget {
  final String title;
  final String content;

  const TypeCard({
    Key key,
    @required this.title,
    @required this.content,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.withOpacity(0.6),
              fontWeight: FontWeight.w600,
              fontSize: 17.0
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            content,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17.0
            ),
          )
        ],
      ),
    );
  }
}
