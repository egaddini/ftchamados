// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chamados/app/models/priority.dart';
import 'package:chamados/app/models/setor_model.dart';

class CallCategoryModel {

  int? id;
  SectorModel? sector;
  String? titulo;
  PriorityModel? prioridade;
  String? descricao;
  
  CallCategoryModel({
    this.id,
    required this.sector,
    required this.titulo,
    required this.prioridade,
    required this.descricao,
  });

  CallCategoryModel copyWith({
    int? id,
    SectorModel? sector,
    String? titulo,
    PriorityModel? prioridade,
    String? descricao,
  }) {
    return CallCategoryModel(
      id: id ?? this.id,
      sector: sector ?? this.sector,
      titulo: titulo ?? this.titulo,
      prioridade: prioridade ?? this.prioridade,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'setor': sector ?? sector!.toMap(),
      'titulo': titulo,
      'prioridade': prioridade ?? prioridade!.toMap(),
      'descricao': descricao,
    };
  }

  factory CallCategoryModel.fromMap(Map<String, dynamic> map) {
    return CallCategoryModel(
      id: map['id'] != null ? map['id'] as int : null,
      sector: SectorModel.fromMap(map['sector'] as Map<String,dynamic>),
      titulo: map['titulo'] as String,
      prioridade: PriorityModel.fromMap(map['prioridade'] as Map<String,dynamic>),
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CallCategoryModel.fromJson(String source) => CallCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CallCategoryModel(id: $id, sector: $sector, titulo: $titulo, prioridade: $prioridade, descricao: $descricao)';
  }

  @override
  bool operator ==(covariant CallCategoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.sector == sector &&
      other.titulo == titulo &&
      other.prioridade == prioridade &&
      other.descricao == descricao;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      sector.hashCode ^
      titulo.hashCode ^
      prioridade.hashCode ^
      descricao.hashCode;
  }
}
