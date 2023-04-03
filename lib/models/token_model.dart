import 'dart:convert';

class TokenModel {
  final String token;
  
  TokenModel ({
    required this.token,  
  });
  
  Map<String, dynamic> toMap(){
    return {
      'token':token
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      token: map['token'] ?? ''
    );
  }

  factory TokenModel.fromJson(String json) => TokenModel.fromMap(jsonDecode(json));
  

}