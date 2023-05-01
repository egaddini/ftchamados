// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';



class TipoChamadoModel {

  int id;
  String sigla;
  String prioridade;
  String titulo;
  String descricao;

  TipoChamadoModel({
    required this.id,
    required this.sigla,
    required this.prioridade,
    required this.titulo,
    required this.descricao,
  });


  TipoChamadoModel copyWith({
    int? id,
    String? sigla,
    String? prioridade,
    String? titulo,
    String? descricao,
  }) {
    return TipoChamadoModel(
      id: id ?? this.id,
      sigla: sigla ?? this.sigla,
      prioridade: prioridade ?? this.prioridade,
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sigla': sigla,
      'prioridade': prioridade,
      'titulo': titulo,
      'descricao': descricao,
    };
  }

  factory TipoChamadoModel.fromMap(Map<String, dynamic> map) {
    return TipoChamadoModel(
      id: map['id'] as int,
      sigla: map['sigla'] as String,
      prioridade: map['prioridade'] as String,
      titulo: map['titulo'] as String,
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TipoChamadoModel.fromJson(String source) => TipoChamadoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TipoChamadoModel(id: $id, sigla: $sigla, prioridade: $prioridade, titulo: $titulo, descricao: $descricao)';
  }

  @override
  bool operator ==(covariant TipoChamadoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.sigla == sigla &&
      other.prioridade == prioridade &&
      other.titulo == titulo &&
      other.descricao == descricao;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      sigla.hashCode ^
      prioridade.hashCode ^
      titulo.hashCode ^
      descricao.hashCode;
  }
  
}
