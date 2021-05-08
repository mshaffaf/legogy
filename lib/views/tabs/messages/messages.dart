import 'package:flutter/material.dart';
import '../../../models/message_list_item.dart';
import '../../../global_widgets/header_text.dart';
import '../../../router.dart';

class MessagesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = Container(
      margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
      child: HeaderText(text: "Messages"),
    );

    final list = Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: ListView.separated(
          padding: EdgeInsets.only(bottom: 40.0),
          itemCount: messageListItems.length,
          itemBuilder: (BuildContext context, int index) {
            return messageCard(
              message: messageListItems[index],
              context: context,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10.0);
          },
        ),
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [title, list],
      ),
    );
  }

  Widget messageCard({MessageListItem message, BuildContext context}) {
    final redDot = message.unread == 0
        ? SizedBox()
        : Container(
            height: 22.0,
            width: 22.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: Center(
              child: Text(
                message.unread.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );

    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 0,
      color: Colors.white,
      onPressed: () => Navigator.of(context).pushNamed(
        messageDetailsViewRoute,
        arguments: message,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 14.0),
        leading: userImage(image: message.image),
        title: Text(
          message.name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(message.content),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              message.time,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 5.0),
            redDot
          ],
        ),
      ),
    );
  }

  Widget userImage({String image}) {
    double size = 60.0;

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
    );
  }
}
