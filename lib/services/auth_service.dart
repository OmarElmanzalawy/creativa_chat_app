import 'package:chat_app/views/email_verification_screen.dart';
import 'package:chat_app/views/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {

static Future<bool> checkEmailVerification()async{

  final currentUser = FirebaseAuth.instance.currentUser!;

  await currentUser.reload();

  if(currentUser.emailVerified){
    return true;
  }else{
    return false;
  }
}


static void login({
  required String email,
  required String password,
  required BuildContext context
})async{

  try{

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password
      );

    //Checks if user's email is verified
    final isVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if(isVerified){
      Navigator.push(context, MaterialPageRoute(builder:(context) => HomeScreen(),));
       ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Login successful"))
    );
    }else{
      Navigator.push(context, MaterialPageRoute(builder:(context) => EmailVerificationScreen(),));
       ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Please verify your email"))
    );
    }

  }catch(e){

  }
}


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