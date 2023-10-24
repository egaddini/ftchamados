import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class HistoricModel {
  int? id;
  String? ocurrenceDT;
  String? user;
  String? message;

  HistoricModel({
    this.id,
    this.ocurrenceDT,
    this.user,
    this.message,
  });

  HistoricModel copyWith({
    int? id,
    String? ocurrenceDT,
    String? user,
    String? message,
  }) {
    return HistoricModel(
      id: id ?? this.id,
      ocurrenceDT: ocurrenceDT ?? this.ocurrenceDT,
      user: user ?? this.user,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ocurrenceDT': ocurrenceDT,
      'user': user,
      'message': message,
    };
  }

  factory HistoricModel.fromMap(Map<String, dynamic> map) {
    return HistoricModel(
      id: map['id'] != null ? map['id'] as int : null,
      ocurrenceDT: map['ocurrenceDT'] != null ? map['ocurrenceDT'] as String : null,
      user: map['user'] != null ? map['user'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoricModel.fromJson(String source) =>
      HistoricModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HistoricModel(id: $id, ocurrenceDT: $ocurrenceDT, user: $user, message: $message)';
  }

  @override
  bool operator ==(covariant HistoricModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.ocurrenceDT == ocurrenceDT &&
        other.user == user &&
        other.message == message;
  }

  @override
  int get hashCode {
    return id.hashCode ^ ocurrenceDT.hashCode ^ user.hashCode ^ message.hashCode;
  }
}
