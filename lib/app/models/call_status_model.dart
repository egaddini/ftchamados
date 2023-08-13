// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CallStatusModel {
  
    int id;
    String name;
    String description;
    int weight;
    bool notify;

  CallStatusModel({
    required this.id,
    required this.name,
    required this.description,
    required this.weight,
    required this.notify,
  });

  CallStatusModel copyWith({
    int? id,
    String? name,
    String? description,
    int? weight,
    bool? notify,
  }) {
    return CallStatusModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      weight: weight ?? this.weight,
      notify: notify ?? this.notify,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'weight': weight,
      'notify': notify,
    };
  }

  factory CallStatusModel.fromMap(Map<String, dynamic> map) {
    return CallStatusModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      weight: map['weight'] as int,
      notify: map['notify'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CallStatusModel.fromJson(String source) => CallStatusModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CallStatusModel(id: $id, name: $name, description: $description, weight: $weight, notify: $notify)';
  }

  @override
  bool operator ==(covariant CallStatusModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.weight == weight &&
      other.notify == notify;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      weight.hashCode ^
      notify.hashCode;
  }
}
