import 'package:flutter/material.dart';
import 'package:private_messenger/configs.dart';
import 'package:private_messenger/services/auth_service.dart';
import 'package:private_messenger/strings.dart';
import 'package:private_messenger/style/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool showEmailError = false;
  bool showPasswordError = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    showEmailError = false;
    showPasswordError = false;


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
                    width: 220,
                    height: 220,
                  ),
                ),
                const Center(
                  child: Text(
                    Strings.loginToAccountText,
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
                      Strings.loginText,
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
                      Strings.doNotHaveAccountText,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/signup");
                        },
                        child: const Text(Strings.registerNowText)
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
    bool v1 = checkEmailInput();
    bool v2 = checkPasswordInput();
    bool isInputCorrect = v1 && v2;


    if (isInputCorrect) {
      final authService = Provider.of<AuthService>(context, listen: false);

      try {
        await authService.signInWithEmailAndPassword(_emailController.text, _passwordController.text);

        if (!context.mounted) return;
        gotoMainPage(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
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

  void gotoMainPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/home");
  }
}

