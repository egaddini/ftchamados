import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:chamados/app/models/user_info_model.dart';

import 'call_type.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first


class Call {

  String id;
  UserInfoModel usuario;
  CallType callType;
  String descricao;
  String status;
  DateTime dataCriacao;
  DateTime dataUltAtualizacao;
  List<String> participantes;
  
  Call({
    required this.id,
    required this.callType,
    required this.usuario,
    required this.descricao,
    required this.status,
    required this.dataCriacao,
    required this.dataUltAtualizacao,
    required this.participantes,
  });
  


  Call copyWith({
    String? id,
    CallType? callType,
    UserInfoModel? usuario,
    String? descricao,
    String? status,
    DateTime? dataCriacao,
    DateTime? dataUltAtualizacao,
    List<String>? participantes,
  }) {
    return Call(
      id: id ?? this.id,
      callType: callType ?? this.callType,
      usuario: usuario ?? this.usuario,
      descricao: descricao ?? this.descricao,
      status: status ?? this.status,
      dataCriacao: dataCriacao ?? this.dataCriacao,
      dataUltAtualizacao: dataUltAtualizacao ?? this.dataUltAtualizacao,
      participantes: participantes ?? this.participantes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'callType': callType.toMap(),
      'usuario': usuario.toMap(),
      'descricao': descricao,
      'status': status,
      'dataCriacao': dataCriacao.millisecondsSinceEpoch,
      'dataUltAtualizacao': dataUltAtualizacao.millisecondsSinceEpoch,
      'participantes': participantes,
    };
  }

  factory Call.fromMap(Map<String, dynamic> map) {
    return Call(
      id: map['id'] as String,
      callType: CallType.fromMap(map['callType'] as Map<String,dynamic>),
      usuario: UserInfoModel.fromMap(map['usuario'] as Map<String,dynamic>),
      descricao: map['descricao'] as String,
      status: map['status'] as String,
      dataCriacao: DateTime.fromMillisecondsSinceEpoch(map['dataCriacao'] as int),
      dataUltAtualizacao: DateTime.fromMillisecondsSinceEpoch(map['dataUltAtualizacao'] as int),
      participantes: List<String>.from((map['participantes'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Call.fromJson(String source) => Call.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Call(id: $id, usuario: $usuario, callType: $callType,  descricao: $descricao, status: $status, dataCriacao: $dataCriacao, dataUltAtualizacao: $dataUltAtualizacao, participantes: $participantes)';
  }

  @override
  bool operator ==(covariant Call other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.usuario == usuario &&
      other.callType == callType &&
      other.descricao == descricao &&
      other.status == status &&
      other.dataCriacao == dataCriacao &&
      other.dataUltAtualizacao == dataUltAtualizacao &&
      listEquals(other.participantes, participantes);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      usuario.hashCode ^
      callType.hashCode ^
      descricao.hashCode ^
      status.hashCode ^
      dataCriacao.hashCode ^
      dataUltAtualizacao.hashCode ^
      participantes.hashCode;
  }
}
