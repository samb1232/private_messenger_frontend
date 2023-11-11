import 'package:flutter/material.dart';
import 'package:private_messenger/classes/message_item.dart';
import 'package:private_messenger/strings.dart';
import 'package:private_messenger/style/colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<MessageItem> messagesArr = [
    MessageItem(
        0,
        10,
        "Hello",
        DateTime(2023, 11, 11, 0, 05)
    ),
    MessageItem(
        1,
        -1,
        "Hi",
        DateTime(2023, 11, 11, 0, 06)
    ),
    MessageItem(
        2,
        10,
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
            " Ut enim ad minim veniam, quis nostrud exercitation "
            "ullamco laboris nisi ut aliquip ex ea commodo consequat. "
            "Duis aute irure dolor in reprehenderit in voluptate velit esse "
            "cillum dolore eu fugiat nulla pariatur.",
        DateTime(2023, 11, 11, 0, 07)
    ),
    MessageItem(
        3,
        -1,
        "No please don't do that to me",
        DateTime(2023, 11, 11, 0, 08)
    ),

  ].reversed.toList();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.dark2,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: MyColors.dark1,
        title: const Text(Strings.chatText),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {},
              // TODO: Сделать функционал кнопки действий над чатом
              icon: const Icon(
                Icons.more_vert,
                size: 35,
              ),
            ),
          ),
        ],
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
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: (messagesArr[index].senderId == -1)
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
                        mainAxisAlignment: (messagesArr[index].senderId == -1)
                            ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: (messagesArr[index].senderId == -1)
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
                      // TODO: Реализовать функцию отправки сообщения
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

  String _getMessageDate(DateTime date) {
    // TODO: Сделать нормальное представление времени сообщения
    return "${date.hour.toString().padLeft(2, "0")}:${date.minute.toString().padLeft(2, "0")}";
  }

}
