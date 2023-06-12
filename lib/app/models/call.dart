// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:chamados/app/models/user_info_model.dart';

import 'call_type.dart';

class Call {

  String id;
  UserInfoModel solicitante;
  UserInfoModel responsavel;
  CallType callType;
  String descricao;
  String status;
  DateTime dataCriacao;
  DateTime dataUltAtualizacao;
  List<UserInfoModel> participantes = [];
  List<String> historico = [];
  
  Call({
    required this.id,
    required this.solicitante,
    required this.responsavel,
    required this.callType,
    required this.descricao,
    required this.status,
    required this.dataCriacao,
    required this.dataUltAtualizacao,
    required this.participantes,
    required this.historico,
  });
  


  Call copyWith({
    String? id,
    UserInfoModel? solicitante,
    UserInfoModel? responsavel,
    CallType? callType,
    String? descricao,
    String? status,
    DateTime? dataCriacao,
    DateTime? dataUltAtualizacao,
    List<UserInfoModel>? participantes,
    List<String>? historico,
  }) {
    return Call(
      id: id ?? this.id,
      solicitante: solicitante ?? this.solicitante,
      responsavel: responsavel ?? this.responsavel,
      callType: callType ?? this.callType,
      descricao: descricao ?? this.descricao,
      status: status ?? this.status,
      dataCriacao: dataCriacao ?? this.dataCriacao,
      dataUltAtualizacao: dataUltAtualizacao ?? this.dataUltAtualizacao,
      participantes: participantes ?? this.participantes,
      historico: historico ?? this.historico,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'solicitante': solicitante.toMap(),
      'responsavel': responsavel.toMap(),
      'callType': callType.toMap(),
      'descricao': descricao,
      'status': status,
      'dataCriacao': dataCriacao.millisecondsSinceEpoch,
      'dataUltAtualizacao': dataUltAtualizacao.millisecondsSinceEpoch,
      'participantes': participantes.map((x) => x.toMap()).toList(),
      'historico': historico,
    };
  }

  factory Call.fromMap(Map<String, dynamic> map) {
    return Call(
      id: map['id'] as String,
      solicitante: UserInfoModel.fromMap(map['solicitante'] as Map<String,dynamic>),
      responsavel: UserInfoModel.fromMap(map['responsavel'] as Map<String,dynamic>),
      callType: CallType.fromMap(map['callType'] as Map<String,dynamic>),
      descricao: map['descricao'] as String,
      status: map['status'] as String,
      dataCriacao: DateTime.fromMillisecondsSinceEpoch(map['dataCriacao'] as int),
      dataUltAtualizacao: DateTime.fromMillisecondsSinceEpoch(map['dataUltAtualizacao'] as int),
      participantes: List<UserInfoModel>.from((map['participantes'] as List<int>).map<UserInfoModel>((x) => UserInfoModel.fromMap(x as Map<String,dynamic>),),),
      historico: List<String>.from((map['historico'] as List<String>),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Call.fromJson(String source) => Call.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Call(id: $id, solicitante: $solicitante, responsavel: $responsavel, callType: $callType, descricao: $descricao, status: $status, dataCriacao: $dataCriacao, dataUltAtualizacao: $dataUltAtualizacao, participantes: $participantes, historico: $historico)';
  }

  @override
  bool operator ==(covariant Call other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.solicitante == solicitante &&
      other.responsavel == responsavel &&
      other.callType == callType &&
      other.descricao == descricao &&
      other.status == status &&
      other.dataCriacao == dataCriacao &&
      other.dataUltAtualizacao == dataUltAtualizacao &&
      listEquals(other.participantes, participantes) &&
      listEquals(other.historico, historico);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      solicitante.hashCode ^
      responsavel.hashCode ^
      callType.hashCode ^
      descricao.hashCode ^
      status.hashCode ^
      dataCriacao.hashCode ^
      dataUltAtualizacao.hashCode ^
      participantes.hashCode ^
      historico.hashCode;
  }
}
