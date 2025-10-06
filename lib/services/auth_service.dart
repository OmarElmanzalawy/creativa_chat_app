import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/views/email_verification_screen.dart';
import 'package:chat_app/views/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {

static sendResetEmail(
  String email,
  BuildContext context
  )async{

  try{

    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("email has been sent to $email"))
    );

  }catch(e){

    print("error while reseting password");

  }

  

}

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
  required String userName,
  required BuildContext context
}) async {

  try{

    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password
    );

  await FirebaseAuth.instance.currentUser!.sendEmailVerification();

  await FirebaseAuth.instance.currentUser!.updateDisplayName(userName);

  final user = UserModel(email: email, userName: userName, id: FirebaseAuth.instance.currentUser!.uid);

  

  await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).set(user.toMap());

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