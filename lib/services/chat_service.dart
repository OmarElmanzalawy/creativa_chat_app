import 'package:chat_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {


  static Future<List<UserModel>> getUsers()async{

    final collection = await FirebaseFirestore.instance.collection("users").get();

    return collection.docs
    //Return all documents except current logged in user
    .where((doc) => doc.data()["id"] != FirebaseAuth.instance.currentUser!.uid)
    .map((doc){

      final data = doc.data();

      return UserModel.fromMap(data);

    }).toList();

  }


}