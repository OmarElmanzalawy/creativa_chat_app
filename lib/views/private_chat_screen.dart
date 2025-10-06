import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/services/chat_service.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PrivateChatScreen extends StatefulWidget {
  const PrivateChatScreen({super.key,required this.chatId});

  final String chatId;


  @override
  State<PrivateChatScreen> createState() => _PrivateChatScreenState();
}

class _PrivateChatScreenState extends State<PrivateChatScreen> {

  late Stream<List<MessageModel>> chat_stream;

  final TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    chat_stream = ChatService.getChatStream(widget.chatId);
    chat_stream.listen((data){
      print("stream has new data");
      print(data);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("current user: ${FirebaseAuth.instance.currentUser}");
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Receiver name",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<MessageModel>>(
              stream: chat_stream,
              builder: (context, snapshot) {
                print("current data from stream: ${snapshot.data}");
                print(snapshot.connectionState);
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(snapshot.data?.isEmpty ?? false){
                  return Center(
                    child: Text("No messages sent yet"),
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.only(top:  15,right: 8,left: 8),
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder:(context, index) {
                    final model = snapshot.data![index];
                    return ChatBubble(
                      isMe: true,
                      model: model,
                      );
                    // return Text("gaeiohgoieah");
                  },
                );
              }
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
                      controller: messageController,
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
                      child: IconButton(onPressed: ()async{

                        final message = MessageModel(
                          id: UniqueKey().toString(),
                          message: messageController.text,
                          senderId: FirebaseAuth.instance.currentUser!.uid,
                          // senderName: FirebaseAuth.instance.currentUser!.displayName ?? "No username",
                          senderName: "apeghaipehg",
                          timestamp: DateTime.now()
                        );

                        await ChatService.sendMessage(
                          widget.chatId,
                          message
                        );

                      }, icon: Icon(Icons.send,color: Colors.white,)),
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