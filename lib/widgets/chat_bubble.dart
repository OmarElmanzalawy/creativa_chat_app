import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key,required this.isMe});

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Username",style: TextStyle(fontWeight: FontWeight.w600),),
                        Container(
                          padding: EdgeInsets.all(12),
                          child: Text("This is the message",style: TextStyle(color: Colors.white),),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.blue : Colors.grey,
                            borderRadius:BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12)
                            )
                          ),
                    
                        ),
                        Text("3 days ago",style: TextStyle(color: Colors.black54),)
                      ],
                    ),
                  );
  }
}