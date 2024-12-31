// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TypesModel {
  List<String> type;
  TypesModel({
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
    };
  }

  factory TypesModel.fromMap(List<dynamic> map) {
    return TypesModel(
      type: List.generate(map.length, (index) => map[index],)
    );
  }

  String toJson() => json.encode(toMap());

}
