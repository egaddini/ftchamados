// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chamados/app/models/call_type.dart';

class ClassDTO {

  int solicitante;
  int callType;
  String descricao;
  ClassDTO({
    required this.solicitante,
    required this.callType,
    required this.descricao,
  });
  

  ClassDTO copyWith({
    int? solicitante,
    int? callType,
    String? descricao,
  }) {
    return ClassDTO(
      solicitante: solicitante ?? this.solicitante,
      callType: callType ?? this.callType,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'solicitante': solicitante,
      'callType': callType,
      'descricao': descricao,
    };
  }

  factory ClassDTO.fromMap(Map<String, dynamic> map) {
    return ClassDTO(
      solicitante: map['solicitante'] as int,
      callType: map['callType'] as int,
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassDTO.fromJson(String source) => ClassDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ClassDTO(solicitante: $solicitante, callType: $callType, descricao: $descricao)';

  @override
  bool operator ==(covariant ClassDTO other) {
    if (identical(this, other)) return true;
  
    return 
      other.solicitante == solicitante &&
      other.callType == callType &&
      other.descricao == descricao;
  }

  @override
  int get hashCode => solicitante.hashCode ^ callType.hashCode ^ descricao.hashCode;
}
