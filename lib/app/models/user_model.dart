import 'dart:convert';

class UserModel {
  final String firstname;
  final String lastname;
  final String email;
  final String password;
  
  UserModel ({
    required this.firstname,
    required this.lastname,
    required this.email,  
    required this.password, 
  });
  
  Map<String, dynamic> toMap(){
    return {
      'firstname':firstname,
      'lastname':lastname,
      'email':email,
      'password':password
    };
  }
  

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(firstname: map['firstname'] ?? '',
      lastname: map['lastname'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? ''
    );
  }

  factory UserModel.fromJson(String json) => UserModel.fromMap(jsonDecode(json));
  

}