import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class PrivateChatScreen extends StatelessWidget {
  const PrivateChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Receiver name",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top:  15,right: 8,left: 8),
              children: [
                ChatBubble(isMe: true),
                ChatBubble(isMe: false),
              ],
            )
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              color: Colors.grey.shade50,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.blue)
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue
                      ),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.send,color: Colors.white,)),
                  ),
                const SizedBox(width: 10,),
                ],
              ),
            ),
        ],
      ),
    );
  }
}