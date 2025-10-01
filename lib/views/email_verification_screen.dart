import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

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