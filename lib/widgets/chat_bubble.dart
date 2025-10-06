import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key,required this.isMe,required this.model});

  final bool isMe;
  final MessageModel model;

  @override
  Widget build(BuildContext context) {
    return Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(model.senderName,style: TextStyle(fontWeight: FontWeight.w600),),
                        Container(
                          padding: EdgeInsets.all(12),
                          child: Text(model.message,style: TextStyle(color: Colors.white),),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.blue : Colors.grey,
                            borderRadius:BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12)
                            )
                          ),
                    
                        ),
                        Text(model.timestamp.toString(),style: TextStyle(color: Colors.black54),)
                      ],
                    ),
                  );
  }
}