import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first


class Call {

  String id;
  String usuario;
  String descricao;
  DateTime dataCriacao;
  DateTime dataUltAtualizacao;
  List<String> participantes;

  Call({
    required this.id,
    required this.usuario,
    required this.descricao,
    required this.dataCriacao,
    required this.dataUltAtualizacao,
    required this.participantes,
  });
  

  Call copyWith({
    String? id,
    String? usuario,
    String? descricao,
    DateTime? dataCriacao,
    DateTime? dataUltAtualizacao,
    List<String>? participantes,
  }) {
    return Call(
      id: id ?? this.id,
      usuario: usuario ?? this.usuario,
      descricao: descricao ?? this.descricao,
      dataCriacao: dataCriacao ?? this.dataCriacao,
      dataUltAtualizacao: dataUltAtualizacao ?? this.dataUltAtualizacao,
      participantes: participantes ?? this.participantes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'usuario': usuario,
      'descricao': descricao,
      'dataCriacao': dataCriacao.millisecondsSinceEpoch,
      'dataUltAtualizacao': dataUltAtualizacao.millisecondsSinceEpoch,
      'participantes': participantes,
    };
  }

  factory Call.fromMap(Map<String, dynamic> map) {
    return Call(
      id: map['id'] as String,
      usuario: map['usuario'] as String,
      descricao: map['descricao'] as String,
      dataCriacao: DateTime.fromMillisecondsSinceEpoch(map['dataCriacao'] as int),
      dataUltAtualizacao: DateTime.fromMillisecondsSinceEpoch(map['dataUltAtualizacao'] as int),
      participantes: List<String>.from((map['participantes'] as List<String>),
      )
    );
  }

  String toJson() => json.encode(toMap());

  factory Call.fromJson(String source) => Call.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Call(id: $id, usuario: $usuario, descricao: $descricao, dataCriacao: $dataCriacao, dataUltAtualizacao: $dataUltAtualizacao, participantes: $participantes)';
  }

  @override
  bool operator ==(covariant Call other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.usuario == usuario &&
      other.descricao == descricao &&
      other.dataCriacao == dataCriacao &&
      other.dataUltAtualizacao == dataUltAtualizacao &&
      listEquals(other.participantes, participantes);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      usuario.hashCode ^
      descricao.hashCode ^
      dataCriacao.hashCode ^
      dataUltAtualizacao.hashCode ^
      participantes.hashCode;
  }
}
