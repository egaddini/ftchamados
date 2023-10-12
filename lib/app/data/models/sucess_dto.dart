import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class SucessDTO {
  String message;
  SucessDTO({
    required this.message,
  });

  SucessDTO copyWith({
    String? message,
  }) {
    return SucessDTO(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
    };
  }

  factory SucessDTO.fromMap(Map<String, dynamic> map) {
    return SucessDTO(
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SucessDTO.fromJson(String source) =>
      SucessDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SucessDTO(message: $message)';

  @override
  bool operator ==(covariant SucessDTO other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
