class Message {
  String content;
  bool isFromMe;
  String date;

  Message({this.content, this.isFromMe, this.date});
}

List<Message> messageList = [
  Message(
    content:
        "Hello i am interested in renting an apartment, do you have any available?",
    isFromMe: true,
    date: "Tuesday 9:20 AM",
  ),
  Message(
    content:
        "Thanks for reaching out. We have about 5 apartments available at the moment",
    isFromMe: false,
    date: "Tuesday 10:00 AM",
  ),
  Message(
    content: "Is the price negotiable?",
    isFromMe: true,
    date: "Wednesday 12:13 PM",
  ),
];
