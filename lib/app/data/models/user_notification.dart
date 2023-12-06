import 'dart:convert';

class UserNotification {
  int? id;
  String? ocurrenceDT; 
  String? message;
  bool? isRead;
  
  UserNotification({
    this.id,
    this.ocurrenceDT,
    this.message,
    this.isRead,
  });

  UserNotification copyWith({
    int? id,
    String? ocurrenceDT,
    String? message,
    bool? isRead,
  }) {
    return UserNotification(
      id: id ?? this.id,
      ocurrenceDT: ocurrenceDT ?? this.ocurrenceDT,
      message: message ?? this.message,
      isRead: isRead ?? this.isRead,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ocurrenceDT': ocurrenceDT,
      'message': message,
      'isRead': isRead,
    };
  }

  static List<UserNotification> fromDynamic(List<dynamic> list) => list.map((json) => UserNotification.fromMap(json)).toList(); 

  factory UserNotification.fromMap(Map<String, dynamic> map) {
    return UserNotification(
      id: map['id'] != null ? map['id'] as int : null,
      ocurrenceDT: map['ocurrenceDT'] != null ? map['ocurrenceDT'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      isRead: map['isRead'] != null ? map['isRead'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserNotification.fromJson(String source) => UserNotification.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserNotification(id: $id, ocurrenceDT: $ocurrenceDT, message: $message, isRead: $isRead)';
  }

  @override
  bool operator ==(covariant UserNotification other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.ocurrenceDT == ocurrenceDT &&
      other.message == message &&
      other.isRead == isRead;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      ocurrenceDT.hashCode ^
      message.hashCode ^
      isRead.hashCode;
  }
}
