import 'package:chat_app/models/message_model.dart';
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

  static String createChatId(String receiverId){

    String chatId = "";
    final currentUid = FirebaseAuth.instance.currentUser!.uid;

    if(currentUid.compareTo(receiverId) < 0){
      //current id is smaller
     chatId = "${FirebaseAuth.instance.currentUser!.uid}$receiverId";
    }
    else{
      chatId = "$receiverId${FirebaseAuth.instance.currentUser!.uid}";
    }

    return chatId;
  }


  static Future<bool> doesIdExist(String chatId)async{

    final document =  await FirebaseFirestore.instance.collection("chats").doc(chatId).get();
    return document.exists;

  }

  static Future<void> createChat(String chatId)async{
    await FirebaseFirestore.instance.collection("chats").doc(chatId).set({});
  }

  static Stream<List<MessageModel>> getChatStream(String chatId){

    final snapshot =  FirebaseFirestore.instance.collection("chats").doc(chatId).collection("messages").snapshots();

   return snapshot.map(
      (snapshot){
        return snapshot.docs.map((document) => MessageModel.fromJson(document.data())).toList();
      }
    );
  }




}