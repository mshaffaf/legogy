import 'package:flutter/material.dart';
import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final btnText = Text(
      text.toUpperCase(),
      style: AppTextStyles.btnTextStyle,
    );

    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 50.0,
      color: Theme.of(context).primaryColor,
      elevation: 4.0,
      onPressed: onPressed,
      child: Center(
        child: btnText,
      ),
    );
  }

}
