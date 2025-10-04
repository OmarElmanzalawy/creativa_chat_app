import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return          ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541"),
          ),
          title: Text("Username"),
          subtitle: Text("email@gmail.com"),
          trailing: Icon(Icons.arrow_forward_ios),
         );
  }
}