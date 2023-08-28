import 'dart:convert';

class CommentModel {
  
  String date;
  String user;
  String message;
  CommentModel({
    required this.date,
    required this.user,
    required this.message,
  });

  CommentModel copyWith({
    String? date,
    String? user,
    String? message,
  }) {
    return CommentModel(
      date: date ?? this.date,
      user: user ?? this.user,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'user': user,
      'message': message,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      date: map['date'] as String,
      user: map['user'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) => CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CommentModel(date: $date, user: $user, message: $message)';

  @override
  bool operator ==(covariant CommentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.date == date &&
      other.user == user &&
      other.message == message;
  }

  @override
  int get hashCode => date.hashCode ^ user.hashCode ^ message.hashCode;
}
