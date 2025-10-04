import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class PrivateChatScreen extends StatelessWidget {
  const PrivateChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Receiver name",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView(
                padding: EdgeInsets.only(top:  15),
                children: [
                  ChatBubble(isMe: true),
                  ChatBubble(isMe: false)
                ],
              ),
            )
            )
        ],
      ),
    );
  }
}