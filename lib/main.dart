import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:private_messenger/pages/chat_page.dart';
import 'package:private_messenger/pages/home_page.dart';

void main() {
  runApp(OrientationBuilder(
    builder: (context, orientation) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/chat': (context) => const ChatPage(),
        },
      );
    },
  ));
}