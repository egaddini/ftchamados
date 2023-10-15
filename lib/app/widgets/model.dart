import 'dart:convert';

abstract class Model {

  Map<String, dynamic> toMap();

  fromMap(Map<String, dynamic> map);

  String toJson() => json.encode(toMap());

  fromJson(String source) => fromMap(json.decode(source) as Map<String, dynamic>);

  

}
