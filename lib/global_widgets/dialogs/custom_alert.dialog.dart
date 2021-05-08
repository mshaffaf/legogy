import 'package:flutter/material.dart';
import '../../services/dialog.service.dart';
import '../../utils/utils.dart';
import 'package:lottie/lottie.dart';
import '../../utils/colors.dart';

class CustomAlertDialog extends StatelessWidget {
  final AlertDialogType type;
  final String title;
  final String subtitle;
  final String okayText;
  final String cancelText;

  const CustomAlertDialog({
    Key key,
    this.type = AlertDialogType.success,
    this.title = "Successful!",
    this.subtitle,
    this.okayText = "OK",
    this.cancelText = "CANCEL",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final header = Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      color: CustomColors.primaryDarkColor,
      height: 200.0,
      child: Center(
        child: Lottie.asset(
          AppAnim.success,
        ),
      ),
    );

    final content = Container(
      padding: EdgeInsets.all(10.0),
      height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.grey.withOpacity(0.7),
            ),
          )
        ],
      ),
    );

    final cancelBtn = Expanded(
      child: InkWell(
        onTap: () => Navigator.pop(context, false),
        child: Container(
          // color: Colors.grey,
          child: Center(
            child: _buildButtonData(false, cancelText),
          ),
        ),
      ),
    );

    final okayBtn = Expanded(
      child: InkWell(
        onTap: () => Navigator.pop(context, true),
        child: Container(
          child: Center(
            child: _buildButtonData(true, okayText),
          ),
        ),
      ),
    );

    final buttons = Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[cancelBtn, okayBtn],
      ),
    );

    return Container(
      height: 400.0,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[header, content, buttons],
      ),
    );
  }

  Widget _buildButtonData(bool isOkayBtn, String text) {
    final color = isOkayBtn ? Colors.grey : Colors.grey;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        )
      ],
    );
  }
}
