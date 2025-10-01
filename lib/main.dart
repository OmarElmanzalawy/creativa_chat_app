import 'package:chat_app/views/email_verification_screen.dart';
import 'package:chat_app/views/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  //Make sure that flutter engine has initialized
  WidgetsFlutterBinding.ensureInitialized();
  //Initialize firebase
  await Firebase.initializeApp();
  print("Firebase initialized");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: SignUpScreen(),
    );
  }
}
