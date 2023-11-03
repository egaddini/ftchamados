import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class PriorityModel {
  int? id;
  String name;
  int weight;

  PriorityModel({
    this.id,
    required this.name,
    required this.weight,
  });

  PriorityModel copyWith({
    int? id,
    String? name,
    int? weight,
  }) {
    return PriorityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'weight': weight,
    };
  }

  factory PriorityModel.fromMap(Map<String, dynamic> map) {
    return PriorityModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      weight: map['weight'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PriorityModel.fromJson(String source) =>
      PriorityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PriorityModel(id: $id, name: $name, weight: $weight)';

  @override
  bool operator ==(covariant PriorityModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.weight == weight;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ weight.hashCode;

  static List<PriorityModel> fromDynamic(List<dynamic> list) => list.map((json) => PriorityModel.fromMap(json)).toList(); 

}
