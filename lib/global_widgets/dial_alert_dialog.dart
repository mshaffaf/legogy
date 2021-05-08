import 'package:flutter/material.dart';
import '../models/message_list_item.dart';
import 'package:slider_button/slider_button.dart';

class DialAlertDialog extends StatelessWidget {
  final MessageListItem messageListItem;

  const DialAlertDialog({Key key, this.messageListItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userImage = Container(
      margin: EdgeInsets.only(bottom: 10.0),
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(messageListItem.image),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    );

    final slidingButton = SliderButton(
      width: MediaQuery.of(context).size.width * 0.7,
      vibrationFlag: false,
      height: 55.0,
      buttonSize: 50.0,
      dismissible: false,
      action: () {},
      label: Text(
        "Slide to call",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
      ),
      icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
      buttonColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
      boxShadow: BoxShadow(),
      alignLabel: Alignment(0,0),
    );

    final content = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                Row(
                  children: [
                    userImage,
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Voice Call",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          messageListItem.name + "?",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                slidingButton
              ],
            ),
          )
        ],
      ),
    );

    return Container(
      height: 220.0,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[content],
      ),
    );
  }
}
