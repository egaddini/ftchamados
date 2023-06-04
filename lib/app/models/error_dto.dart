// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ErrorDTO {

  String message;
  int status;

  ErrorDTO({
    required this.message,
    required this.status,
  });
  
  ErrorDTO copyWith({
    String? message,
    int? status,
  }) {
    return ErrorDTO(
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'status': status,
    };
  }

  factory ErrorDTO.fromMap(Map<String, dynamic> map) {
    return ErrorDTO(
      message: map['message'] as String,
      status: map['status'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorDTO.fromJson(String source) => ErrorDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ErrorDTO(message: $message, status: $status)';

  @override
  bool operator ==(covariant ErrorDTO other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message &&
      other.status == status;
  }

  @override
  int get hashCode => message.hashCode ^ status.hashCode;
  
}
