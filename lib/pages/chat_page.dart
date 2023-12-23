import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:private_messenger/classes/message_item.dart';
import 'package:private_messenger/services/chat_service.dart';
import 'package:private_messenger/strings.dart';
import 'package:private_messenger/style/colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final TextEditingController _messageController = TextEditingController();


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ChatService _chatService = ChatService();
  // final NotificationService _notificationService = NotificationService();

  List<MessageItem> messagesArr = [];


  @override
  void initState() {
    super.initState();

  }

  void _getMessagesFromDB(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    
    List<MessageItem> newChatItems = [];
    MessageItem newMessage;
    for (QueryDocumentSnapshot doc in docs) {
      newMessage = MessageItem(
          senderEmail: doc['senderEmail'],
          text: doc["messageText"],
          sentDate: doc['sentDate'].toDate()
      );
      newChatItems.add(newMessage);
    }

    messagesArr = newChatItems;
    if (mounted) {
      setState(() {
        messagesArr.sort((MessageItem a, MessageItem b) {
          return b.sentDate.compareTo(a.sentDate);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String chatId = args['chatId'];
    String interlocutorEmail = args['interlocutorEmail'];

    FirebaseFirestore.instance.collection('messages')
        .where('chatId', isEqualTo: chatId)
        .snapshots().listen((QuerySnapshot<Map<String, dynamic>> event) {
      _getMessagesFromDB(event.docs);
      //_notificationService.markChatAsRead(chatId);
    });

    return Scaffold(
      backgroundColor: MyColors.dark2,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: MyColors.dark1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/home");
          },
        ),
        title: Text(interlocutorEmail),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: messagesArr.length,
                itemBuilder: (BuildContext context, int index) {
                  bool isSender = messagesArr[index].senderEmail == _auth.currentUser!.email;
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: isSender
                            ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          Text(
                            _getMessageDate(messagesArr[index].sentDate),
                            style: const TextStyle(
                              color: MyColors.grey1,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                      Row(
                        mainAxisAlignment: isSender
                            ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: isSender
                                  ? MyColors.grey1 : MyColors.grey2,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            constraints: const BoxConstraints(
                                minWidth: 50,
                                minHeight: 30,
                                maxWidth: 250
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                              child: Text(
                                messagesArr[index].text,
                                style: const TextStyle(
                                    color: MyColors.light1,
                                    fontSize: 20
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                    ],
                  );
                },

              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 7),
                    child: TextField(
                      controller: _messageController,
                      style: const TextStyle(
                        color: MyColors.light1,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: MyColors.dark1,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: Strings.messageHintText,
                        hintStyle: const TextStyle(
                          color: MyColors.grey1,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 55,
                  height: 55,
                  decoration: const BoxDecoration(
                      color: MyColors.grey1,
                      shape: BoxShape.circle
                  ),
                  margin: const EdgeInsets.only(left: 5),
                  child: IconButton(
                    icon: const Icon(Icons.send_sharp),
                    color: MyColors.light1,
                    iconSize: 30,
                    onPressed: () {
                      _sendMessage(chatId, interlocutorEmail);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }


  void _sendMessage(String chatId, String recipientEmail) {
    String message = _messageController.text.trim();
    if (message.isEmpty) return;
    try {
      _chatService.sendMessage(chatId, message);
      // _notificationService.markChatAsUnread(recipientEmail, chatId);
      _messageController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }


  }

  String _getMessageDate(DateTime date) {
    return "${date.hour.toString().padLeft(2, "0")}:${date.minute.toString().padLeft(2, "0")}";
  }

}
