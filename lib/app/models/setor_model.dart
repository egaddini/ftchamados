// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SectorModel {
  
  int? id;
  String sigla;
  String nome;

  SectorModel({
    this.id,
    required this.sigla,
    required this.nome,
  });

  SectorModel copyWith({
    int? id,
    String? sigla,
    String? nome,
  }) {
    return SectorModel(
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

  factory SectorModel.fromMap(Map<String, dynamic> map) {
    return SectorModel(
      id: map['id'] as int,
      sigla: map['sigla'] as String,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SectorModel.fromJson(String source) => SectorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SectorModel(id: $id, sigla: $sigla, nome: $nome)';

  @override
  bool operator ==(covariant SectorModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.sigla == sigla &&
      other.nome == nome;
  }

  @override
  int get hashCode => id.hashCode ^ sigla.hashCode ^ nome.hashCode;
}
