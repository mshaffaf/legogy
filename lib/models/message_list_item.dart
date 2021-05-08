import '../utils/utils.dart';

class MessageListItem {
  int unread;
  String name, image, time, content;
  MessageListItem({this.name, this.image, this.time, this.unread, this.content});
}

List<MessageListItem> messageListItems = [
  MessageListItem(
    name: "Veronica Jung",
    image: AppImages.woman1,
    time: "9:20 AM",
    unread: 5,
    content: "Hi there, the price is negotiable 😅."
  ),
  MessageListItem(
    name: "James Corton",
    image: AppImages.man1,
    time: "8:10 AM",
    unread: 0,
    content: "You need to give me a call soon"
  ),
  MessageListItem(
    name: "Nicole Ben",
    image: AppImages.woman2,
    time: "Yesterday",
    unread: 0,
    content: "Thank you for the information"
  ),
  MessageListItem(
    name: "Simone Stark",
    image: AppImages.woman3,
    time: "15 Sept",
    unread: 0,
    content: "Sorry but i will be busy tomorrow"
  ),
  MessageListItem(
    name: "Harry Goodnews",
    image: AppImages.man2,
    time: "11 Aug",
    unread: 0,
    content: "I ❤️ the house"
  ),
];
