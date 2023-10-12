import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CallDTO {
  int solicitante;
  int callType;
  String descricao;
  CallDTO({
    required this.solicitante,
    required this.callType,
    required this.descricao,
  });

  CallDTO copyWith({
    int? solicitante,
    int? callType,
    String? descricao,
  }) {
    return CallDTO(
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

  factory CallDTO.fromMap(Map<String, dynamic> map) {
    return CallDTO(
      solicitante: map['solicitante'] as int,
      callType: map['callType'] as int,
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CallDTO.fromJson(String source) =>
      CallDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CallDTO(solicitante: $solicitante, callType: $callType, descricao: $descricao)';

  @override
  bool operator ==(covariant CallDTO other) {
    if (identical(this, other)) return true;

    return other.solicitante == solicitante &&
        other.callType == callType &&
        other.descricao == descricao;
  }

  @override
  int get hashCode =>
      solicitante.hashCode ^ callType.hashCode ^ descricao.hashCode;
}
