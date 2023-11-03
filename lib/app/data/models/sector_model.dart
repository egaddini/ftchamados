import 'dart:convert';

class SectorModel {
  int? id;
  String acronym;
  String name;

  SectorModel({
    this.id,
    required this.acronym,
    required this.name,
  });

  SectorModel copyWith({
    int? id,
    String? acronym,
    String? name,
  }) {
    return SectorModel(
      id: id ?? this.id,
      acronym: acronym ?? this.acronym,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'acronym': acronym,
      'name': name,
    };
  }

  factory SectorModel.fromMap(Map<String, dynamic> map) {
    return SectorModel(
      id: map['id'] as int,
      acronym: map['acronym'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SectorModel.fromJson(String source) =>
      SectorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SectorModel(id: $id, acronym: $acronym, name: $name)';

  @override
  bool operator ==(covariant SectorModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.acronym == acronym && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ acronym.hashCode ^ name.hashCode;

  static List<SectorModel> fromDynamic(List<dynamic> list) => list.map((json) => SectorModel.fromMap(json)).toList(); 

}
