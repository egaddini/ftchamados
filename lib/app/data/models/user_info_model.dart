import 'dart:convert';

import 'package:chamados/app/data/models/user_notification.dart';

import 'sector_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

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
  List<SectorModel> sectors;
  List<UserNotification> notifications;
  int? unread;

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
    required this.sectors,
    required this.notifications,
    this.unread,
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
    List<SectorModel>? sectors,
    List<UserNotification>? notifications,
    int? unread,
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
      sectors: sectors ?? this.sectors,
      notifications: notifications ?? this.notifications,
      unread: unread ?? this.unread,
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
      'sectors':  sectors.map((e) => e.toMap()).toList(),
      'notifications': notifications.map((e) => e.toMap()).toList(),
      'unread': unread,
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
      creationDT:map['creationDT'] != null ? map['creationDT'] as String : null,
      sectors: map['sectors'] != null ? (map['sectors'] as List<dynamic>).map((json) => SectorModel.fromMap(json)).toList() : [],
      notifications: map['notifications'] != null ? (map['notifications'] as List<dynamic>).map((json) => UserNotification.fromMap(json)).toList() : [],
      unread: map['unread'] != null ? map['unread'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromJson(String source) => UserInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserInfoModel(id: $id, email: $email, firstName: $firstName, lastName: $lastName, phone: $phone, role: $role, token: $token, active: $active, creationDT: $creationDT, sectors: $sectors, notifications: $notifications, unread: $unread)';
  }

  @override
  bool operator ==(covariant UserInfoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phone == phone &&
        other.role == role &&
        other.token == token &&
        other.active == active &&
        other.creationDT == creationDT &&
        other.sectors == sectors &&
        other.notifications == notifications &&
        other.unread == unread;
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
        creationDT.hashCode ^
        sectors.hashCode ^
        unread.hashCode ^
        notifications.hashCode;
  }

  bool isAdmin() {
    return 'ADMIN' == role;
  }

  bool isSolver() {
    return 'SOLVER' == role;
  }

  bool isUser() {
    return 'USER' == role;
  }
}
