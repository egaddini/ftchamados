// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserInfoModel {
  
  int? id;
  String? email;
  String? nome;
  String? sobrenome;
  int? telefone;
  String? role;
  String? token;
  bool? habilitado;
  String? dataCriacao;
  UserInfoModel({
    this.id,
    this.email,
    this.nome,
    this.sobrenome,
    this.telefone,
    this.role,
    this.token,
    this.habilitado,
    this.dataCriacao,
  });
 
  UserInfoModel copyWith({
    int? id,
    String? email,
    String? nome,
    String? sobrenome,
    int? telefone,
    String? role,
    String? token,
    bool? habilitado,
    String? dataCriacao,
  }) {
    return UserInfoModel(
      id: id ?? this.id,
      email: email ?? this.email,
      nome: nome ?? this.nome,
      sobrenome: sobrenome ?? this.sobrenome,
      telefone: telefone ?? this.telefone,
      role: role ?? this.role,
      token: token ?? this.token,
      habilitado: habilitado ?? this.habilitado,
      dataCriacao: dataCriacao ?? this.dataCriacao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'nome': nome,
      'sobrenome': sobrenome,
      'telefone': telefone,
      'role': role,
      'token': token,
      'habilitado': habilitado,
      'dataCriacao': dataCriacao,
    };
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      id: map['id'] != null ? map['id'] as int : null,
      email: map['email'] != null ? map['email'] as String : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
      sobrenome: map['sobrenome'] != null ? map['sobrenome'] as String : null,
      telefone: map['telefone'] != null ? map['telefone'] as int : null,
      role: map['role'] != null ? map['role'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      habilitado: map['habilitado'] != null ? map['habilitado'] as bool : null,
      dataCriacao: map['dataCriacao'] != null ? map['dataCriacao'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromJson(String source) => UserInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserInfoModel(id: $id, email: $email, nome: $nome, sobrenome: $sobrenome, telefone: $telefone, role: $role, token: $token, habilitado: $habilitado, dataCriacao: $dataCriacao)';
  }

  @override
  bool operator ==(covariant UserInfoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.email == email &&
      other.nome == nome &&
      other.sobrenome == sobrenome &&
      other.telefone == telefone &&
      other.role == role &&
      other.token == token &&
      other.habilitado == habilitado &&
      other.dataCriacao == dataCriacao;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      email.hashCode ^
      nome.hashCode ^
      sobrenome.hashCode ^
      telefone.hashCode ^
      role.hashCode ^
      token.hashCode ^
      habilitado.hashCode ^
      dataCriacao.hashCode;
  }

  bool isAdmin() {
    return 'ADMIN' == role;
  }
}
