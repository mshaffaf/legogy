import 'package:flutter/material.dart';
import '../../../global_widgets/dial_alert_dialog.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import '../../../models/message.dart';
import '../../../models/message_list_item.dart';
import '../../../utils/colors.dart';

class MessageDetailsPage extends StatefulWidget {
  final MessageListItem messageListItem;

  const MessageDetailsPage({Key key, this.messageListItem}) : super(key: key);

  @override
  _MessageDetailsPageState createState() => _MessageDetailsPageState();
}

class _MessageDetailsPageState extends State<MessageDetailsPage> {
  TextEditingController content = new TextEditingController();
  List<Message> messages = messageList;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  void addMessage() {
    setState(() {
      if (content.text != "") {
        messages.add(Message(content: content.text, isFromMe: true, date: "Now"));
        content.text = "";
      }
      _scrollController.animateTo(
        0.0,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    final image = Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(widget.messageListItem.image),
          fit: BoxFit.cover,
        ),
      ),
    );

    final appBar = AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          image,
          SizedBox(width: 20.0),
          Text(
            widget.messageListItem.name,
            style: TextStyle(
              color: CustomColors.primaryDarkColor,
              fontSize: 18.0,
            ),
          )
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: IconButton(
            onPressed: () {
              showDialog(
                barrierDismissible: true,
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: DialAlertDialog(
                      messageListItem: widget.messageListItem,
                    ),
                  );
                },
              );
            },
            icon: Icon(
              LineAwesomeIcons.phone,
            ),
            color: Colors.black,
          ),
        )
      ],
    );

    final chatContainer = ListView(
      controller: _scrollController,
      reverse: true,
      children: <Widget>[
        getMessages(),
      ],
    );

    final bottom = Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      height: 60.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: content,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type your message",
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_circle_outline,
              color: Theme.of(context).primaryColor,
            ),
          ),
          IconButton(
            onPressed: () => addMessage(),
            icon: Icon(
              LineAwesomeIcons.paper_plane,
              color: Theme.of(context).primaryColor,
              size: 26,
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(child: chatContainer),
            ),
            bottom
          ],
        ),
      ),
    );
  }

  Widget getMessages() {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < messages.length; i++) {
      list.add(chatBubble(message: messages[i]));
    }
    return Column(children: list);
  }

  Widget chatBubble({Message message}) {
    return Align(
      alignment:
          message.isFromMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: message.isFromMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6,
            ),
            padding: EdgeInsets.all(15.0),
            child: Text(
              message.content,
              style: TextStyle(
                fontSize: 15.0,
                color: message.isFromMe
                    ? Colors.white
                    : CustomColors.primaryDarkColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            decoration: BoxDecoration(
              color: message.isFromMe
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: message.isFromMe
                  ? BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    )
                  : BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
            child: Text(
              message.date,
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
