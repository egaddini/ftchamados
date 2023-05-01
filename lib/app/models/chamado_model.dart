import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first


class ChamadoModel {

  String id;
  String categoria;
  String usuario;
  String descricao;
  DateTime dataCriacao;
  DateTime dataUltAtualizacao;
  bool finalizado;
  ChamadoModel({
    required this.id,
    required this.categoria,
    required this.usuario,
    required this.descricao,
    required this.dataCriacao,
    required this.dataUltAtualizacao,
    required this.finalizado,
  });


  ChamadoModel copyWith({
    String? id,
    String? categoria,
    String? usuario,
    String? descricao,
    DateTime? dataCriacao,
    DateTime? dataUltAtualizacao,
    bool? finalizado,
  }) {
    return ChamadoModel(
      id: id ?? this.id,
      categoria: categoria ?? this.categoria,
      usuario: usuario ?? this.usuario,
      descricao: descricao ?? this.descricao,
      dataCriacao: dataCriacao ?? this.dataCriacao,
      dataUltAtualizacao: dataUltAtualizacao ?? this.dataUltAtualizacao,
      finalizado: finalizado ?? this.finalizado,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categoria': categoria,
      'usuario': usuario,
      'descricao': descricao,
      'dataCriacao': dataCriacao.millisecondsSinceEpoch,
      'dataUltAtualizacao': dataUltAtualizacao.millisecondsSinceEpoch,
      'finalizado': finalizado,
    };
  }

  factory ChamadoModel.fromMap(Map<String, dynamic> map) {
    return ChamadoModel(
      id: map['id'] as String,
      categoria: map['categoria'] as String,
      usuario: map['usuario'] as String,
      descricao: map['descricao'] as String,
      dataCriacao: DateTime.fromMillisecondsSinceEpoch(map['dataCriacao'] as int),
      dataUltAtualizacao: DateTime.fromMillisecondsSinceEpoch(map['dataUltAtualizacao'] as int),
      finalizado: map['finalizado'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChamadoModel.fromJson(String source) => ChamadoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChamadoModel(id: $id, categoria: $categoria, usuario: $usuario, descricao: $descricao, dataCriacao: $dataCriacao, dataUltAtualizacao: $dataUltAtualizacao, finalizado: $finalizado)';
  }

  @override
  bool operator ==(covariant ChamadoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.categoria == categoria &&
      other.usuario == usuario &&
      other.descricao == descricao &&
      other.dataCriacao == dataCriacao &&
      other.dataUltAtualizacao == dataUltAtualizacao &&
      other.finalizado == finalizado;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      categoria.hashCode ^
      usuario.hashCode ^
      descricao.hashCode ^
      dataCriacao.hashCode ^
      dataUltAtualizacao.hashCode ^
      finalizado.hashCode;
  }
}
