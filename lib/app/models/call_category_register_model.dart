import 'dart:convert';

class CallCategoryRegisterModel {

  String title;
  int sectorId;
  int priorityId;
  String description;

  CallCategoryRegisterModel({
    required this.title,
    required this.sectorId,
    required this.priorityId,
    required this.description,
  });

  CallCategoryRegisterModel copyWith({
    String? title,
    int? sectorId,
    int? priorityId,
    String? description,
  }) {
    return CallCategoryRegisterModel(
      title: title ?? this.title,
      sectorId: sectorId ?? this.sectorId,
      priorityId: priorityId ?? this.priorityId,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'sectorId': sectorId,
      'priorityId': priorityId,
      'description': description,
    };
  }

  factory CallCategoryRegisterModel.fromMap(Map<String, dynamic> map) {
    return CallCategoryRegisterModel(
      title: map['title'] as String,
      sectorId: map['sectorId'] as int,
      priorityId: map['priorityId'] as int,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CallCategoryRegisterModel.fromJson(String source) => CallCategoryRegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CallCategoryRegisterModel(title: $title, sectorId: $sectorId, priorityId: $priorityId, description: $description)';
  }

  @override
  bool operator ==(covariant CallCategoryRegisterModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.sectorId == sectorId &&
      other.priorityId == priorityId &&
      other.description == description;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      sectorId.hashCode ^
      priorityId.hashCode ^
      description.hashCode;
  }
}
