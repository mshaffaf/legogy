import 'package:flutter/material.dart';
import '../utils/utils.dart';

class EmptyState extends StatelessWidget {
  final message;

  const EmptyState({Key key, @required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(AppImages.empty),
            SizedBox(
              height: 20.0,
            ),
            Text(
              message.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}
