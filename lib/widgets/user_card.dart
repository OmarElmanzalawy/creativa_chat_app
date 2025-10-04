import 'package:chat_app/models/user_model.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key,required this.model});

  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541"),
          ),
          title: Text(model.userName),
          subtitle: Text(model.email),
          trailing: Icon(Icons.arrow_forward_ios),
         );
  }
}