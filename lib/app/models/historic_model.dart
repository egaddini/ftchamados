// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HistoricModel {
  
  int? id;
  String? dateTime;
  String? user;
  String? message;

  HistoricModel({
    this.id,
    this.dateTime,
    this.user,
    this.message,
  });

  HistoricModel copyWith({
    int? id,
    String? dateTime,
    String? user,
    String? message,
  }) {
    return HistoricModel(
      id: id ?? this.id,
      dateTime: dateTime ?? this.dateTime,
      user: user ?? this.user,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'dateTime': dateTime,
      'user': user,
      'message': message,
    };
  }

  factory HistoricModel.fromMap(Map<String, dynamic> map) {
    return HistoricModel(
      id: map['id'] != null ? map['id'] as int : null,
      dateTime: map['dateTime'] != null ? map['dateTime'] as String : null,
      user: map['user'] != null ? map['user'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoricModel.fromJson(String source) => HistoricModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HistoricModel(id: $id, dateTime: $dateTime, user: $user, message: $message)';
  }

  @override
  bool operator ==(covariant HistoricModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.dateTime == dateTime &&
      other.user == user &&
      other.message == message;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      dateTime.hashCode ^
      user.hashCode ^
      message.hashCode;
  }
}
