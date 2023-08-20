// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PriorityModel {

  int? id;
  String nome;
  int weight;
  
  PriorityModel({
    this.id,
    required this.nome,
    required this.weight,
  });

  PriorityModel copyWith({
    int? id,
    String? nome,
    int? weight,
  }) {
    return PriorityModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'weight': weight,
    };
  }

  factory PriorityModel.fromMap(Map<String, dynamic> map) {
    return PriorityModel(
      id: map['id'] != null ? map['id'] as int : null,
      nome: map['nome'] as String,
      weight: map['weight'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PriorityModel.fromJson(String source) => PriorityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PriorityModel(id: $id, nome: $nome, weight: $weight)';

  @override
  bool operator ==(covariant PriorityModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nome == nome &&
      other.weight == weight;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ weight.hashCode;
}
