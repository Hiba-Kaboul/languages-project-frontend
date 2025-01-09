// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetBooksModel {
  int id;
  String name;
  String image;
  String author;
  num price;
  GetBooksModel({
    required this.id,
    required this.name,
    required this.image,
    required this.author,
    required this.price,
  });

  GetBooksModel copyWith({
    int? id,
    String? name,
    String? image,
    String? author,
    num? price,
  }) {
    return GetBooksModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      author: author ?? this.author,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'author': author,
      'price': price,
    };
  }

  factory GetBooksModel.fromMap(Map<String, dynamic> map) {
    return GetBooksModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      author: map['author'] as String,
      price: map['price'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetBooksModel.fromJson(String source) => GetBooksModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetBooksModel(id: $id, name: $name, image: $image, author: $author, price: $price)';
  }

  @override
  bool operator ==(covariant GetBooksModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.image == image &&
      other.author == author &&
      other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      author.hashCode ^
      price.hashCode;
  }
}
