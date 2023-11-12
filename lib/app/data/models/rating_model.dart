import 'dart:convert';

class RatingModel {
  
  int callID;

  int satisfaction;

  int solveTime;

  String feedback;
  RatingModel({
    required this.callID,
    required this.satisfaction,
    required this.solveTime,
    required this.feedback,
  });
  

  RatingModel copyWith({
    int? callID,
    int? satisfaction,
    int? solveTime,
    String? feedback,
  }) {
    return RatingModel(
      callID: callID ?? this.callID,
      satisfaction: satisfaction ?? this.satisfaction,
      solveTime: solveTime ?? this.solveTime,
      feedback: feedback ?? this.feedback,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'callID': callID,
      'satisfaction': satisfaction,
      'solveTime': solveTime,
      'feedback': feedback,
    };
  }

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      callID: map['callID'] as int,
      satisfaction: map['satisfaction'] as int,
      solveTime: map['solveTime'] as int,
      feedback: map['feedback'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingModel.fromJson(String source) => RatingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RatingModel(callID: $callID, satisfaction: $satisfaction, solveTime: $solveTime, feedback: $feedback)';
  }

  @override
  bool operator ==(covariant RatingModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.callID == callID &&
      other.satisfaction == satisfaction &&
      other.solveTime == solveTime &&
      other.feedback == feedback;
  }

  @override
  int get hashCode {
    return callID.hashCode ^
      satisfaction.hashCode ^
      solveTime.hashCode ^
      feedback.hashCode;
  }

}
