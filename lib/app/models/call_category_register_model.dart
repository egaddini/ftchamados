import 'dart:convert';

class CallCategoryRegisterModel {

  String titulo;
  int setorId;
  int prioridadeId;
  String descricao;
  CallCategoryRegisterModel({
    required this.titulo,
    required this.setorId,
    required this.prioridadeId,
    required this.descricao,
  });
  

  CallCategoryRegisterModel copyWith({
    String? titulo,
    int? setorId,
    int? prioridadeId,
    String? descricao,
  }) {
    return CallCategoryRegisterModel(
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

  factory CallCategoryRegisterModel.fromMap(Map<String, dynamic> map) {
    return CallCategoryRegisterModel(
      titulo: map['titulo'] as String,
      setorId: map['setorId'] as int,
      prioridadeId: map['prioridadeId'] as int,
      descricao: map['descricao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CallCategoryRegisterModel.fromJson(String source) => CallCategoryRegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CallCategoryRegisterModel(titulo: $titulo, setorId: $setorId, prioridadeId: $prioridadeId, descricao: $descricao)';
  }

  @override
  bool operator ==(covariant CallCategoryRegisterModel other) {
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
