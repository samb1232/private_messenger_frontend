class ChatItem {
  String chatId;
  String otherEmail;
  String? chatLastMessage;
  DateTime lastMessageDate;
  bool hasUnreadMessages;

  ChatItem({
    required this.chatId,
    required this.otherEmail,
    required this.chatLastMessage,
    required this.lastMessageDate,
    required this.hasUnreadMessages,
  });
}