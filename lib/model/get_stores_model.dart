// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetStoresModel {
  String messege;
  List<Store> stores;
  GetStoresModel({
    required this.messege,
    required this.stores,
  });

  GetStoresModel copyWith({
    String? messege,
    List<Store>? stores,
  }) {
    return GetStoresModel(
      messege: messege ?? this.messege,
      stores: stores ?? this.stores,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messege': messege,
      'stores': stores.map((x) => x.toMap()).toList(),
    };
  }

  factory GetStoresModel.fromMap(Map<String, dynamic> map) {
    return GetStoresModel(
      messege: map['messege'] as String,
      stores: List<Store>.from(
        (map['stores'] as List<dynamic>).map<Store>(
          (x) => Store.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetStoresModel.fromJson(String source) =>
      GetStoresModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GetStoresModel(messege: $messege, stores: $stores)';

  @override
  bool operator ==(covariant GetStoresModel other) {
    if (identical(this, other)) return true;

    return other.messege == messege && listEquals(other.stores, stores);
  }

  @override
  int get hashCode => messege.hashCode ^ stores.hashCode;
}

class Store {
  int id;
  String name;
  String image;
  Store({
    required this.id,
    required this.name,
    required this.image,
  });

  Store copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return Store(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Store.fromJson(String source) =>
      Store.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Store(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(covariant Store other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
