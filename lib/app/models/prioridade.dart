import 'dart:convert';

class Prioridade {

  int id;
  int peso;
  String nome;
  
  Prioridade({
    required this.id,
    required this.peso,
    required this.nome,
  });

  Prioridade copyWith({
    int? id,
    int? peso,
    String? nome,
  }) {
    return Prioridade(
      id: id ?? this.id,
      peso: peso ?? this.peso,
      nome: nome ?? this.nome,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'peso': peso,
      'nome': nome,
    };
  }

  factory Prioridade.fromMap(Map<String, dynamic> map) {
    return Prioridade(
      id: map['id'] as int,
      peso: map['peso'] as int,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Prioridade.fromJson(String source) => Prioridade.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Prioridade(id: $id, peso: $peso, nome: $nome)';

  @override
  bool operator ==(covariant Prioridade other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.peso == peso &&
      other.nome == nome;
  }

  @override
  int get hashCode => id.hashCode ^ peso.hashCode ^ nome.hashCode;
}
