// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CallType {

  int id;
  String sigla;
  String setor;
  String titulo;
  String prioridade;
  String descricao;

  CallType({
    required this.id,
    required this.sigla,
    required this.setor,
    required this.titulo,
    required this.prioridade,
    required this.descricao,
  });

  CallType copyWith({
    int? id,
    String? sigla,
    String? setor,
    String? titulo,
    String? prioridade,
    String? descricao,
  }) {
    return CallType(
      id: id ?? this.id,
      sigla: sigla ?? this.sigla,
      setor: setor ?? this.setor,
      titulo: titulo ?? this.titulo,
      prioridade: prioridade ?? this.prioridade,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sigla': sigla,
      'setor': setor,
      'titulo': titulo,
      'prioridade': prioridade,
      'descricao': descricao,
    };
  }

  factory CallType.fromMap(Map<String, dynamic> map) {
    return CallType(
      id: map['id'] as int,
      sigla: map['sigla'] as String,
      setor: map['setor'] as String,
      titulo: map['titulo'] as String,
      prioridade: map['prioridade'] as String,
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CallType.fromJson(String source) => CallType.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CallType(id: $id, sigla: $sigla, setor: $setor, titulo: $titulo, prioridade: $prioridade, descricao: $descricao)';
  }

  @override
  bool operator ==(covariant CallType other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.sigla == sigla &&
      other.setor == setor &&
      other.titulo == titulo &&
      other.prioridade == prioridade &&
      other.descricao == descricao;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      sigla.hashCode ^
      setor.hashCode ^
      titulo.hashCode ^
      prioridade.hashCode ^
      descricao.hashCode;
  }
}
