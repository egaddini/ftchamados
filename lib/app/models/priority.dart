// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class PriorityModel {

  String nome;
  int peso;
  PriorityModel({
    required this.nome,
    required this.peso,
  });

  PriorityModel copyWith({
    String? nome,
    int? peso,
  }) {
    return PriorityModel(
      nome: nome ?? this.nome,
      peso: peso ?? this.peso,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'peso': peso,
    };
  }

  factory PriorityModel.fromMap(Map<String, dynamic> map) {
    return PriorityModel(
      nome: map['nome'] as String,
      peso: map['peso'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PriorityModel.fromJson(String source) => PriorityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PriorityModel(nome: $nome, peso: $peso)';

  @override
  bool operator ==(covariant PriorityModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.nome == nome &&
      other.peso == peso;
  }

  @override
  int get hashCode => nome.hashCode ^ peso.hashCode;
}
