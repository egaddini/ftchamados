// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PriorityModel {

  int? id;
  String nome;
  int peso;
  
  PriorityModel({
    this.id,
    required this.nome,
    required this.peso,
  });

  PriorityModel copyWith({
    int? id,
    String? nome,
    int? peso,
  }) {
    return PriorityModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      peso: peso ?? this.peso,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'peso': peso,
    };
  }

  factory PriorityModel.fromMap(Map<String, dynamic> map) {
    return PriorityModel(
      id: map['id'] != null ? map['id'] as int : null,
      nome: map['nome'] as String,
      peso: map['peso'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PriorityModel.fromJson(String source) => PriorityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PriorityModel(id: $id, nome: $nome, peso: $peso)';

  @override
  bool operator ==(covariant PriorityModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nome == nome &&
      other.peso == peso;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ peso.hashCode;
}
