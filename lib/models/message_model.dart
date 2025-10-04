class MessageModel {

  final String id;
  final String senderName;
  final String senderId;
  final String message;
  final DateTime timestamp;

  MessageModel({
    required this.id,
    required this.message,
    required this.senderId,
    required this.senderName,
    required this.timestamp
  });


  //abc 
  //123
  // abc123

  //123abc




  factory MessageModel.fromJson(Map<String,dynamic> json){
    return MessageModel(
      id: json["id"],
      message: json['message'],
      senderId: json['senderId'],
      senderName: json['senderName'],
      timestamp: json["timestamp"]
      );
  }

  Map<String, dynamic> toJson(){

    return {
      "id": id,
      "message": message,
      "senderId": senderId,
      "senderName": senderName,
      "timestamp": timestamp
    };

  }



}