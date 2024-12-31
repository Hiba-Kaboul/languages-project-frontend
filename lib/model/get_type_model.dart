// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
class GetTypeModel {
String message;
List<TypeBook> data;
  GetTypeModel({
    required this.message,
    required this.data,
  });



  GetTypeModel copyWith({
    String? message,
    List<TypeBook>? data,
  }) {
    return GetTypeModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory GetTypeModel.fromMap(Map<String, dynamic> map) {
    return GetTypeModel(
      message: map['message'] as String,
      data: List<TypeBook>.from((map['data'] as List<int>).map<TypeBook>((x) => TypeBook.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetTypeModel.fromJson(String source) => GetTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GetTypeModel(message: $message, data: $data)';

  @override
  bool operator ==(covariant GetTypeModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}

class TypeBook {
String name;
String image;
  TypeBook({
    required this.name,
    required this.image,
  });


  TypeBook copyWith({
    String? name,
    String? image,
  }) {
    return TypeBook(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory TypeBook.fromMap(Map<String, dynamic> map) {
    return TypeBook(
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeBook.fromJson(String source) => TypeBook.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TypeBook(name: $name, image: $image)';

  @override
  bool operator ==(covariant TypeBook other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}
