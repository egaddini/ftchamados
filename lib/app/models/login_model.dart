import 'dart:convert';

class LoginModel {
  final String email;
  final String password;
  
  LoginModel ({
    required this.email,  
    required this.password, 
  });
  
  Map<String, dynamic> toMap(){
    return {
      'email':email,
      'password':password
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'] ?? '',
      password: map['password'] ?? ''
    );
  }

  factory LoginModel.fromJson(String json) => LoginModel.fromMap(jsonDecode(json));
  

}