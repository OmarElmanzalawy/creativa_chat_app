class UserModel {

  final String id;
  final String userName;
  final String email;

  UserModel({required this.email,required this.userName,required this.id});

  //From map to UserModel

  factory UserModel.fromMap(Map<String,dynamic> map){
    return UserModel(
      email: map["email"],
      userName: map["userName"],
      id: map["id"]
      );
  }

  //From userModel to map
  Map<String,dynamic> toMap(){
    return {
      "email": email,
      "userName": userName,
      "id": id
    };
  }

}