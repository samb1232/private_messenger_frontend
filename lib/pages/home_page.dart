import 'package:flutter/material.dart';
import 'package:private_messenger/classes/chat_item.dart';
import 'package:private_messenger/strings.dart';
import 'package:private_messenger/style/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static List<ChatItem> chatItemsArr = [
    ChatItem(
        1,
        null,
        "Chat1",
        "Hello. Got some money?",
        DateTime(2023, 11, 11, 0, 30),
        1
    ),
    ChatItem(
        2,
        null,
        "Chat2",
        "Lorem Imsum is simply Lorem Imsum is simply Lorem Imsum is simply",
        DateTime(2023, 11, 9, 10, 0),
        110
    ),
    ChatItem(
        3,
        null,
        "Chat3",
        "Yes. I do",
        DateTime(2023, 10, 10, 10, 0),
        0
    ),
    ChatItem(
        4,
        null,
        "Chat4",
        "Bye. Good night",
        DateTime(2021, 10, 10, 10, 0),
        0
    ),
  ];


  List<ChatItem> displayList = List.from(chatItemsArr);
  void updateFilterList(String value) {
    setState(() {
      displayList = chatItemsArr.where(
              (element) => element.chatName.toLowerCase().contains(value.toLowerCase())
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.dark2,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: MyColors.dark1,
        title: const Text(Strings.messengerText),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {}, // TODO: Сделать функционал кнопки добавления чата
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
              child: ListView.builder(
                itemCount: displayList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 90,
                    width: double.infinity,
                    color: (index % 2 == 0) ? MyColors.dark3 : MyColors.dark2,
                    child: ListTile(
                      onTap: () => _openChat(displayList[index].id),
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
                                    displayList[index].chatName,
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
                              _getChatLastMessage(displayList[index].chatLastMessage),
                              _getChatUnreadMessagesBox(displayList[index].unreadMessagesNumber)
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

  Widget _getChatUnreadMessagesBox(int? numberOfUnreadMessages) {
    if (numberOfUnreadMessages == null || numberOfUnreadMessages == 0) {
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
      child: Center(
        child: Text(
          "$numberOfUnreadMessages",
          style: const TextStyle(
            color: MyColors.light1,
          ),
        ),
      ),
    );
  }

  Widget _getChatLastMessage (String? lastMessage) {
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

  void _openChat(int chatId) {
    Navigator.pushNamed(context, "/chat");
  }
}
