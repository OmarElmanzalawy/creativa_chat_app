import 'package:chat_app/views/email_verification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {


//register
static void registerUser({
  required String email,
  required String password,
  required BuildContext context
}) async {

  try{

    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password
    );

  await FirebaseAuth.instance.currentUser!.sendEmailVerification();

  Navigator.push(context, MaterialPageRoute(builder:(context) => EmailVerificationScreen(),));

  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("User has been created"))
    );

  }catch(e){
    //display snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error happened while signing up"))
    );
    print(e.toString());
  }
  



}


}