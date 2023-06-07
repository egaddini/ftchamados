// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Setor {
  
  int id;
  String sigla;
  String nome;

  Setor({
    required this.id,
    required this.sigla,
    required this.nome,
  });

  Setor copyWith({
    int? id,
    String? sigla,
    String? nome,
  }) {
    return Setor(
      id: id ?? this.id,
      sigla: sigla ?? this.sigla,
      nome: nome ?? this.nome,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sigla': sigla,
      'nome': nome,
    };
  }

  factory Setor.fromMap(Map<String, dynamic> map) {
    return Setor(
      id: map['id'] as int,
      sigla: map['sigla'] as String,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Setor.fromJson(String source) => Setor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Setor(id: $id, sigla: $sigla, nome: $nome)';

  @override
  bool operator ==(covariant Setor other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.sigla == sigla &&
      other.nome == nome;
  }

  @override
  int get hashCode => id.hashCode ^ sigla.hashCode ^ nome.hashCode;
}
