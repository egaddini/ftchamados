// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CallTypeDTO {
  
  String titulo;
  int setorId;
  int prioridadeId;
  String descricao;
  
  CallTypeDTO({
    required this.titulo,
    required this.setorId,
    required this.prioridadeId,
    required this.descricao,
  });
  

  CallTypeDTO copyWith({
    String? titulo,
    int? setorId,
    int? prioridadeId,
    String? descricao,
  }) {
    return CallTypeDTO(
      titulo: titulo ?? this.titulo,
      setorId: setorId ?? this.setorId,
      prioridadeId: prioridadeId ?? this.prioridadeId,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titulo': titulo,
      'setorId': setorId,
      'prioridadeId': prioridadeId,
      'descricao': descricao,
    };
  }

  factory CallTypeDTO.fromMap(Map<String, dynamic> map) {
    return CallTypeDTO(
      titulo: map['titulo'] as String,
      setorId: map['setorId'] as int,
      prioridadeId: map['prioridadeId'] as int,
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CallTypeDTO.fromJson(String source) => CallTypeDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CallTypeDTO(titulo: $titulo, setorId: $setorId, prioridadeId: $prioridadeId, descricao: $descricao)';
  }

  @override
  bool operator ==(covariant CallTypeDTO other) {
    if (identical(this, other)) return true;
  
    return 
      other.titulo == titulo &&
      other.setorId == setorId &&
      other.prioridadeId == prioridadeId &&
      other.descricao == descricao;
  }

  @override
  int get hashCode {
    return titulo.hashCode ^
      setorId.hashCode ^
      prioridadeId.hashCode ^
      descricao.hashCode;
  }
}
