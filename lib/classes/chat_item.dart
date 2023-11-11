import 'package:flutter/material.dart';

class ChatItem {
  int id;
  Image? chatImage;
  String chatName;
  String? chatLastMessage;
  DateTime lastMessageDate;
  int? unreadMessagesNumber;

  ChatItem(
      this.id,
      this.chatImage,
      this.chatName,
      this.chatLastMessage,
      this.lastMessageDate,
      this.unreadMessagesNumber
      );
}