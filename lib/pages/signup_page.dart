import 'package:flutter/material.dart';
import 'package:private_messenger/strings.dart';
import 'package:private_messenger/style/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                    Strings.nicknameText,
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
                          hintText: Strings.nicknameExampleHintText,
                          hintStyle: const TextStyle(
                            color: MyColors.grey1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                  child: Text(
                    Strings.incorrectNicknameText,
                    style: TextStyle(
                      color: MyColors.error,
                      fontSize: 15,
                    ),
                  ),
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
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                  child: Text(
                    Strings.incorrectPasswordText,
                    style: TextStyle(
                      color: MyColors.error,
                      fontSize: 15,
                    ),
                  ),
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
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                  child: Text(
                    Strings.incorrectPasswordText,
                    style: TextStyle(
                      color: MyColors.error,
                      fontSize: 15,
                    ),
                  ),
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
                      // TODO: Реализовать функцию проверки ника и пароля
                      gotoMainPage(context);
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
}

void gotoMainPage(BuildContext context) {
  Navigator.pushReplacementNamed(context, "/home");
}
