import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:private_messenger/firebase_options.dart';
import 'package:private_messenger/pages/add_new_chat_page.dart';
import 'package:private_messenger/pages/chat_page.dart';
import 'package:private_messenger/pages/home_page.dart';
import 'package:private_messenger/pages/login_page.dart';
import 'package:private_messenger/pages/signup_page.dart';
import 'package:private_messenger/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
      create: (context) => AuthService(),
    child: const MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
