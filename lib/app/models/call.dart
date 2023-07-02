// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chamados/app/models/user_dto.dart';

import 'call_type.dart';

class Call {

    int id;
    String dataCriacao;
    String dataUltAtualizacao;
    String status;
    UserDTO? solicitante;
    UserDTO? responsavel;
    CallType? callType;
    String descricao;
    String historico;

  Call({
    required this.id,
    required this.dataCriacao,
    required this.dataUltAtualizacao,
    required this.status,
    required this.solicitante,
    required this.responsavel,
    required this.callType,
    required this.descricao,
    required this.historico,
  });
    

  Call copyWith({
    int? id,
    String? dataCriacao,
    String? dataUltAtualizacao,
    String? status,
    UserDTO? solicitante,
    UserDTO? responsavel,
    CallType? callType,    
    String? descricao,
    String? historico,
  }) {
    return Call(
      id: id ?? this.id,
      dataCriacao: dataCriacao ?? this.dataCriacao,
      dataUltAtualizacao: dataUltAtualizacao ?? this.dataUltAtualizacao,
      status: status ?? this.status,
      solicitante: solicitante ?? this.solicitante,
      responsavel: responsavel ?? this.responsavel,
      callType: callType ?? this.callType,
      descricao: descricao ?? this.descricao,
      historico: historico ?? this.historico,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'dataCriacao': dataCriacao,
      'dataUltAtualizacao': dataUltAtualizacao,
      'status': status,
      'descricao': descricao,
      'historico': historico,
    };
  }

  factory Call.fromMap(Map<String, dynamic> map) {
    return Call(
      id: map['id'] as int,
      dataCriacao: map['dataCriacao'] as String,
      dataUltAtualizacao: map['dataUltAtualizacao'] as String,
      status: map['status'] as String,
      solicitante: UserDTO.fromMap(map['solicitante'] as Map<String, dynamic>),
      responsavel: map['responsavel'] != null ? UserDTO.fromMap(map['responsavel'] as Map<String, dynamic>) : null,
      callType: map['callType'] != null ? CallType.fromMap(map['callType'] as Map<String, dynamic>) : null,
      descricao: map['descricao'] as String,
      historico: map['historico'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Call.fromJson(String source) => Call.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Call(id: $id, dataCriacao: $dataCriacao, dataUltAtualizacao: $dataUltAtualizacao, status: $status, solicitante: $solicitante, responsavel: $responsavel, callType: $callType, descricao: $descricao, historico: $historico)';
  }

  @override
  bool operator ==(covariant Call other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.dataCriacao == dataCriacao &&
      other.dataUltAtualizacao == dataUltAtualizacao &&
      other.status == status &&
      other.solicitante == solicitante &&
      other.responsavel == responsavel &&
      other.callType == callType &&
      other.descricao == descricao &&
      other.historico == historico;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      dataCriacao.hashCode ^
      dataUltAtualizacao.hashCode ^
      status.hashCode ^
      solicitante.hashCode ^
      responsavel.hashCode ^
      callType.hashCode ^
      descricao.hashCode ^
      historico.hashCode;
  }
}
