import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:private_messenger/pages/add_new_chat_page.dart';
import 'package:private_messenger/pages/chat_page.dart';
import 'package:private_messenger/pages/home_page.dart';
import 'package:private_messenger/pages/login_page.dart';
import 'package:private_messenger/pages/signup_page.dart';

void main() {
  runApp(OrientationBuilder(
    builder: (context, orientation) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      return MaterialApp(
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignUpPage(),
          '/home': (context) => const HomePage(),
          '/chat': (context) => const ChatPage(),
          '/add_new_chat': (context) => const AddNewChatPage(),
        },
      );
    },
  ));
}