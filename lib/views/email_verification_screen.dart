import 'dart:async';

import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/views/home_screen.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  late final Timer _timer;

  @override
  void initState() {

    _timer = Timer.periodic(Duration(seconds: 3), (_)async{
      final isVerified = await AuthService.checkEmailVerification();

      if(isVerified){
        Navigator.push(context, MaterialPageRoute(builder:(context) => HomeScreen(),));
      }
    });

    
    
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mail,size: 80,),
            CircularProgressIndicator(
              color: Colors.blue,
            ),
            Text("Waiting for email verification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
          ],
        ),
      ),
    );
  }
}