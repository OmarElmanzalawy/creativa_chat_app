import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/services/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatBubble extends StatelessWidget {
 const ChatBubble({super.key,required this.model,required this.chatId});

  
  final MessageModel model;
  final String chatId;
  

  @override
  Widget build(BuildContext context) {
    final bool isMe = FirebaseAuth.instance.currentUser!.uid == model.senderId ;
    return Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: GestureDetector(
                      onTapDown: isMe ? (details) {
                        print("hold detected");
                        showDialog(
                          context: context,
                          builder:(context) {
                            return AlertDialog.adaptive(
                              title: Text("Delete Message?"),
                              content: Text("Are you sure you want to delete this message"),
                              actions: [
                                TextButton(onPressed: (){
                                  Navigator.pop(context);
                                } , child: Text("Cancel",style: TextStyle(color: Colors.blue),)),
                                TextButton(onPressed:  (){
                                  ChatService.deletePrivateMessage(chatId, model.id);
                                  Navigator.pop(context);
                                } , child: Text("Delete",style: TextStyle(color: Colors.red),))
                              ],
                            );
                          },
                          );
                      } : null ,
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
                          Text(timeago.format(model.timestamp),style: TextStyle(color: Colors.black54),)
                        ],
                      ),
                    ),
                  );
  }
}