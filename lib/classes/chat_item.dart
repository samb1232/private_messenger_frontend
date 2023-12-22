class ChatItem {
  String chatId;
  String otherEmail;
  String? chatLastMessage;
  DateTime lastMessageDate;

  ChatItem({
    required this.chatId,
    required this.otherEmail,
    required this.chatLastMessage,
    required this.lastMessageDate,
  });
}