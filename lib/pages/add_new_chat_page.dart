import 'package:flutter/material.dart';
import 'package:private_messenger/services/auth_service.dart';
import 'package:private_messenger/strings.dart';
import 'package:private_messenger/style/colors.dart';
import 'package:provider/provider.dart';

class AddNewChatPage extends StatefulWidget {
  const AddNewChatPage({super.key});

  @override
  State<AddNewChatPage> createState() => _AddNewChatPageState();
}

class _AddNewChatPageState extends State<AddNewChatPage> {
  
  final TextEditingController _emailController = TextEditingController();

  bool showEmailError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.dark2,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: MyColors.dark1,
        title: const Text(Strings.addChatText),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                Strings.enterUserEmailText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _emailController,
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
                      hintText: Strings.emailExampleHintText,
                      hintStyle: const TextStyle(
                        color: MyColors.grey1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
              child: showEmailError ? const Text(
                Strings.incorrectEmailText,
                style: TextStyle(
                  color: MyColors.error,
                  fontSize: 15,
                ),
              ) : const Text(""),
            ),
            const SizedBox(height: 60,),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.grey1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  processInputData(context);
                },
                child: const Text(
                  Strings.createChatText,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void processInputData(BuildContext context) async {
    bool isInputCorrect = checkEmailInput();


    if (isInputCorrect) {
      addNewChat();
    }
  }
  
  bool checkEmailInput() {
    String text = _emailController.text;
    final usernameRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (text.isNotEmpty && usernameRegex.hasMatch(text)) {
      setState(() {
        showEmailError = false;
      });
      return true;
    }
    else {
      setState(() {
        showEmailError = true;
      });
      return false;
    }
  }

  void addNewChat() {
    // TODO: Реализовать функцию добавления нового чата
  }
}
