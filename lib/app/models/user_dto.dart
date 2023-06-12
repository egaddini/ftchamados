// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDTO {

  int id;
  String email;
  
  UserDTO({
    required this.id,
    required this.email,
  });


  UserDTO copyWith({
    int? id,
    String? email,
  }) {
    return UserDTO(
      id: id ?? this.id,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
    };
  }

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      id: map['id'] as int,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDTO.fromJson(String source) => UserDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserDTO(id: $id, email: $email)';

  @override
  bool operator ==(covariant UserDTO other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode;
}
