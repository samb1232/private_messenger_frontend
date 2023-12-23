import 'package:flutter/material.dart';
import 'package:private_messenger/strings.dart';
import 'package:private_messenger/style/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool showEmailError = false;
  bool showPasswordError = false;
  bool showPasswordAgainError = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController = TextEditingController();

  @override
  void initState() {
    super.initState();
    showEmailError = false;
    showPasswordError = false;
    showPasswordAgainError = false;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.dark3,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ListView(
              children: [
                Center(
                  child: SvgPicture.asset(
                    "assets/logo.svg",
                    width: 200,
                    height: 200,
                  ),
                ),
                const Center(
                  child: Text(
                    Strings.createNewAccountText,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    Strings.emailText,
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
                const SizedBox(height: 15,),

                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    Strings.passwordText,
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
                        controller: _passwordController,
                        obscureText: true,
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
                          hintText: Strings.passwordExampleHintText,
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
                  child: showPasswordError ? const Text(
                    Strings.incorrectPasswordText,
                    style: TextStyle(
                      color: MyColors.error,
                      fontSize: 15,
                    ),
                  ) : const Text(""),
                ),
                const SizedBox(height: 15,),

                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    Strings.passwordAgainText,
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
                        controller: _passwordAgainController,
                        obscureText: true,
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
                          hintText: Strings.passwordExampleHintText,
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
                  child: showPasswordAgainError ? const Text(
                    Strings.incorrectPasswordAgainText,
                    style: TextStyle(
                      color: MyColors.error,
                      fontSize: 15,
                    ),
                  ) : const Text(""),
                ),
                const SizedBox(height: 40,),


                SizedBox(
                  width: double.infinity,
                  height: 70,
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
                      Strings.registerText,
                      style: TextStyle(
                          fontSize: 24,

                          color: Colors.white
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      Strings.alreadyHaveAccountText,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/login");
                        },
                        child: const Text(Strings.loginNowText)
                    )
                  ],
                )

              ],
            ),
          )
      ),
    );
  }

  void processInputData(BuildContext context) async {
    bool v1 = checkNicknameInput();
    bool v2 = checkPasswordInput();
    bool v3 = checkPasswordAgainInput();
    bool isInputCorrect = v1 && v2 && v3;


      if (isInputCorrect) {
        final authService = Provider.of<AuthService>(context, listen: false);

        try {
          await authService.signUpWithEmailAndPassword(_emailController.text, _passwordController.text);

          if (!context.mounted) return;
          gotoMainPage(context);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }

  bool checkNicknameInput() {
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

  bool checkPasswordInput() {
    String text = _passwordController.text;

    if (text.isNotEmpty && text.length >= 4 && !text.contains(" ")) {
      setState(() {
        showPasswordError = false;
      });
      return true;
    }
    else {
      setState(() {
        showPasswordError = true;
      });
      return false;
    }
  }

  bool checkPasswordAgainInput() {
    String passwordText = _passwordController.text;
    String passwordRepeatText = _passwordAgainController.text;

    if (passwordText == passwordRepeatText) {
      setState(() {
        showPasswordAgainError = false;
      });
      return true;
    }
    else {
      setState(() {
        showPasswordAgainError = true;
      });
      return false;
    }
  }

  void gotoMainPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/home");
  }
}
