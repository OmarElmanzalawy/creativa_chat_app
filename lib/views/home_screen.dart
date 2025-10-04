import 'package:chat_app/main.dart';
import 'package:chat_app/view_model/appbrain.dart';
import 'package:chat_app/widgets/user_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    appBrain.getUsers();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users List",style: TextStyle(color: Colors.white),),centerTitle: false,backgroundColor: Colors.blue,),
      body: Column(
        children: [
         Expanded(
          child: ValueListenableBuilder(
            valueListenable: appBrain.users,
            builder:(context, value, child) {
              return ListView.builder(
              itemCount: appBrain.users.value.length,
              itemBuilder:(context, index) {
                final model = appBrain.users.value[index];
                return UserCard(
                  model: model,
                );
              },
              );
            } 
          )
         )
        ],
      )
    );
  }
}