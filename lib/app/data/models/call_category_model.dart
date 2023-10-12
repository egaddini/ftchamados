import 'dart:convert';

import 'priority.dart';
import 'sector_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CallCategoryModel {
  int? id;
  SectorModel? sector;
  String? title;
  PriorityModel? priority;
  String? description;

  CallCategoryModel({
    this.id,
    required this.sector,
    required this.title,
    required this.priority,
    required this.description,
  });

  CallCategoryModel copyWith({
    int? id,
    SectorModel? sector,
    String? title,
    PriorityModel? priority,
    String? description,
  }) {
    return CallCategoryModel(
      id: id ?? this.id,
      sector: sector ?? this.sector,
      title: title ?? this.title,
      priority: priority ?? this.priority,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'setor': sector ?? sector!.toMap(),
      'title': title,
      'priority': priority ?? priority!.toMap(),
      'description': description,
    };
  }

  factory CallCategoryModel.fromMap(Map<String, dynamic> map) {
    return CallCategoryModel(
      id: map['id'] != null ? map['id'] as int : null,
      sector: SectorModel.fromMap(map['sector'] as Map<String, dynamic>),
      title: map['title'] as String,
      priority: PriorityModel.fromMap(map['priority'] as Map<String, dynamic>),
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CallCategoryModel.fromJson(String source) =>
      CallCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CallCategoryModel(id: $id, sector: $sector, title: $title, priority: $priority, description: $description)';
  }

  @override
  bool operator ==(covariant CallCategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.sector == sector &&
        other.title == title &&
        other.priority == priority &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        sector.hashCode ^
        title.hashCode ^
        priority.hashCode ^
        description.hashCode;
  }
}
