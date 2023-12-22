import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:private_messenger/services/chat_display_service.dart';

class ChatService extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final ChatDisplayService _chatDisplayService = ChatDisplayService();


  Future<void> sendMessage(String chatId, String message) async {
    DateTime dateTimeNow = DateTime.now();
    await _firestore.collection('messages').add({
      'chatId': chatId,
      'senderEmail': _auth.currentUser!.email,
      'messageText': message,
      'sentDate': dateTimeNow
    });
    await _chatDisplayService.updateChat(
        chatId: chatId,
        lastMessage: message,
        lastMessageDate: dateTimeNow
    );
  }
}