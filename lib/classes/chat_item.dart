class ChatItem {
  String id;
  String chatEmail;
  String? chatLastMessage;
  DateTime lastMessageDate;

  ChatItem({
    required this.id,
    required this.chatEmail,
    required this.chatLastMessage,
    required this.lastMessageDate,
  });
}