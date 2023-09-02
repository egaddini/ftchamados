// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserInfoModel {
  
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  int? phone;
  String? role;
  String? token;
  bool? active;
  String? creationDT;

  UserInfoModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.role,
    this.token,
    this.active,
    this.creationDT,
  });
 
  UserInfoModel copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    int? phone,
    String? role,
    String? token,
    bool? active,
    String? creationDT,
  }) {
    return UserInfoModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      token: token ?? this.token,
      active: active ?? this.active,
      creationDT: creationDT ?? this.creationDT,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'role': role,
      'token': token,
      'active': active,
      'creationDT': creationDT,
    };
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      id: map['id'] != null ? map['id'] as int : null,
      email: map['email'] != null ? map['email'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      phone: map['phone'] != null ? map['phone'] as int : null,
      role: map['role'] != null ? map['role'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      active: map['active'] != null ? map['active'] as bool : null,
      creationDT: map['creationDT'] != null ? map['creationDT'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromJson(String source) => UserInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserInfoModel(id: $id, email: $email, firstName: $firstName, lastName: $lastName, phone: $phone, role: $role, token: $token, active: $active, creationDT: $creationDT)';
  }

  @override
  bool operator ==(covariant UserInfoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.email == email &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.phone == phone &&
      other.role == role &&
      other.token == token &&
      other.active == active &&
      other.creationDT == creationDT;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      email.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      phone.hashCode ^
      role.hashCode ^
      token.hashCode ^
      active.hashCode ^
      creationDT.hashCode;
  }

  bool isAdmin() {
    return 'ADMIN' == role;
  }

  List<UserInfoModel> convertJsonToUsers(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) {
      return UserInfoModel(
        id: json['id'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        phone: json['phone'],
        role: json['role'],
        token: json['token'],
        active: json['active'],
        creationDT: json['creationDT'],
      );
    }).toList();
  }
}
