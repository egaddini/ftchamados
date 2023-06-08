// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chamados/app/models/setor.dart';

class CallType {

  int? id;
  Setor setor;
  String titulo;
  String prioridade;
  String descricao;

  CallType({
    this.id,
    required this.setor,
    required this.titulo,
    required this.prioridade,
    required this.descricao,
  });

  CallType copyWith({
    int? id,
    Setor? setor,
    String? titulo,
    String? prioridade,
    String? descricao,
  }) {
    return CallType(
      id: id ?? this.id,
      setor: setor ?? this.setor,
      titulo: titulo ?? this.titulo,
      prioridade: prioridade ?? this.prioridade,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'setor': setor.toMap(),
      'titulo': titulo,
      'prioridade': prioridade,
      'descricao': descricao,
    };
  }

  factory CallType.fromMap(Map<String, dynamic> map) {
    return CallType(
      id: map['id'] != null ? map['id'] as int : null,
      setor: Setor.fromMap(map['setor'] as Map<String,dynamic>),
      titulo: map['titulo'] as String,
      prioridade: map['prioridade'] as String,
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CallType.fromJson(String source) => CallType.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CallType(id: $id, setor: $setor, titulo: $titulo, prioridade: $prioridade, descricao: $descricao)';
  }

  @override
  bool operator ==(covariant CallType other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.setor == setor &&
      other.titulo == titulo &&
      other.prioridade == prioridade &&
      other.descricao == descricao;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      setor.hashCode ^
      titulo.hashCode ^
      prioridade.hashCode ^
      descricao.hashCode;
  }
}
