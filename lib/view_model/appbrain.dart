import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/services/chat_service.dart';
import 'package:flutter/widgets.dart';

class Appbrain {

  ValueNotifier<List<UserModel>> users = ValueNotifier([]);


  void getUsers()async{
    //Call function from chatservice

    final serviceUsers = await ChatService.getUsers();

    users.value = serviceUsers; 

    //
  }

}