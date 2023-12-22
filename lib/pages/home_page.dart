import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:private_messenger/classes/chat_item.dart';
import 'package:private_messenger/services/auth_service.dart';
import 'package:private_messenger/strings.dart';
import 'package:private_messenger/style/colors.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  static List<ChatItem> chatItemsArr = [];

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance.collection('chats')
        .where('participants', arrayContains: _auth.currentUser!.email)
        .snapshots().listen((QuerySnapshot<Map<String, dynamic>> event) {
          _getUserItemsFromDB(event.docs);
    });
  }

  void _getUserItemsFromDB(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    List<ChatItem> newChatItems = [];
    ChatItem newItem;
    for (QueryDocumentSnapshot doc in docs) {
      newItem = ChatItem(
          chatId: doc.id,
          otherEmail: doc["participants"][0] == _auth.currentUser!.email
              ? doc["participants"][1] : doc["participants"][0],
          chatLastMessage: doc['lastMessage'],
          lastMessageDate: doc['lastMessageDate'].toDate()
      );
      newChatItems.add(newItem);
    }

    chatItemsArr = newChatItems;
    updateList();

  }


  List<ChatItem> displayList = List.from(chatItemsArr);
  void updateFilterList(String value) {
    if (mounted) {
      setState(() {
        displayList = chatItemsArr.where(
                (element) => element.otherEmail.toLowerCase().contains(value.toLowerCase())
        ).toList();
        displayList.sort((ChatItem a, ChatItem b) {
          return b.lastMessageDate.compareTo(a.lastMessageDate);
        });
      });
    }

  }

  void updateList() {
    if (mounted) {
      setState(() {
        displayList = List.from(chatItemsArr);
        displayList.sort((ChatItem a, ChatItem b) {
          return b.lastMessageDate.compareTo(a.lastMessageDate);
        });
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.dark2,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: MyColors.dark1,
        leading: IconButton(
          icon: const Icon(Icons.logout_rounded),
          onPressed: () {
            logOut(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              Strings.messengerText,
              style: TextStyle(
                  fontSize: 22
              ),
            ),
            Text(
              _auth.currentUser?.email??"",
              style: const TextStyle(
                fontSize: 16
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_new_chat');
              },
              icon: const Icon(
                Icons.add,
                size: 35,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              onChanged: (String value) {
                return updateFilterList(value);
              },
              style: const TextStyle(
                color: MyColors.light1,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: MyColors.grey1),
                  borderRadius: BorderRadius.circular(15),
                ),
                filled: true,
                fillColor: MyColors.dark1,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: Strings.searchBarHintText,
                hintStyle: const TextStyle(
                  color: MyColors.grey1,
                ),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: MyColors.light1,
              ),
            ),
          ),
          Expanded(
              child: displayList.isEmpty
                  ? const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      Center(child: Text(
                Strings.emptyChatsListText,
                style: TextStyle(
                        color: Colors.white,
                        fontSize: 22
                ),)),
                    ],
                  )
                  : ListView.builder(
                itemCount: displayList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 90,
                    width: double.infinity,
                    color: (index % 2 == 0) ? MyColors.dark3 : MyColors.dark2,
                    child: ListTile(
                      onTap: () => _openChat(displayList[index].chatId,
                          displayList[index].otherEmail),
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage("assets/profile_picture.jpg"),
                        radius: 35,
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                    displayList[index].otherEmail,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: MyColors.light1,
                                    )
                                ),
                              ),
                              Text(
                                _getChatLastMessageDateString(displayList[index].lastMessageDate),
                                style: const TextStyle(
                                  color: MyColors.light1,
                                ),
                              ),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _getChatLastMessageWidget(displayList[index].chatLastMessage),
                              Container() // TODO: реализовать отображение непрочитаннных сообщений
                            ],
                          )
                        ],
                      ),

                    ),
                  );
                },

              )
          ),
        ],
      ),
    );
  }
  
  String _getChatLastMessageDateString(DateTime date) {
    DateTime todayDate = DateTime.now();

    if (date.year != todayDate.year) {
      return "${date.year} ${Strings.months[date.month-1]}";
    }
    if (date.month == todayDate.month && date.day == todayDate.day) {
      return "${date.hour.toString().padLeft(2, "0")}:"
          "${date.minute.toString().padLeft(2, "0")}";
    }
    if (todayDate.difference(date).inDays == 1) {
      return Strings.yesterdayText;
    }
    return "${Strings.months[date.month-1]} ${date.day}";
  }

  Widget _getChatUnreadMessagesBoxWidget(bool hasUnreadMessages) {
    if (!hasUnreadMessages) {
      return const SizedBox();
    }
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.grey1,
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: const BoxConstraints(
        minWidth: 26,
      ),
    );
  }

  Widget _getChatLastMessageWidget (String? lastMessage) {
    if (lastMessage == null) {
      return const SizedBox();
    }
    return Expanded(
      child: Text(
        lastMessage,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: MyColors.light1,
        ),
      ),
    );
  }

  void _openChat(String chatId, String interlocutorEmail) {
    Navigator.pushNamed(context, "/chat",
        arguments: {
      'chatId' : chatId,
      'interlocutorEmail': interlocutorEmail,
        });
  }

  void logOut(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
    Navigator.pushReplacementNamed(context, "/login");
  }
}
