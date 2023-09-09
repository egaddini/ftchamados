// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chamados/app/models/sector_model.dart';

class UserModel {
  
  final String firstname;
  final String lastname;
  final int phone;
  final String email;
  final String password;
  final List<SectorModel> sectors;
  
  UserModel({
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.email,
    required this.password,
    required this.sectors,
  });
  
  UserModel copyWith({
    String? firstname,
    String? lastname,
    int? phone,
    String? email,
    String? password,
    List<SectorModel>? sectors,
  }) {
    return UserModel(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      sectors: sectors ?? this.sectors,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstname': firstname,
      'lastname': lastname,
      'phone': phone,
      'email': email,
      'password': password,
      'sectors': sectors.map((e) => e.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      phone: map['phone'] as int,
      email: map['email'] as String,
      password: map['password'] as String,
      sectors: map['sectors'] != null ? (map['sectors'] as List<dynamic>).map((json) => SectorModel.fromJson(json)).toList() : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(firstname: $firstname, lastname: $lastname, phone: $phone, email: $email, password: $password, sectors: $sectors)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.firstname == firstname &&
      other.lastname == lastname &&
      other.phone == phone &&
      other.email == email &&
      other.password == password &&
      other.sectors == sectors;
  }

  @override
  int get hashCode {
    return firstname.hashCode ^
      lastname.hashCode ^
      phone.hashCode ^
      email.hashCode ^
      password.hashCode ^
      sectors.hashCode;
  }
}
