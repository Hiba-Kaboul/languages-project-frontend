// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BooksDetailModel {
int id;
  String name;
  String author;
  String image;
  num price;
  String ratings;
  String details;
  BooksDetailModel({
    required this.id,
    required this.name,
    required this.author,
    required this.image,
    required this.price,
    required this.ratings,
    required this.details,
  });

  BooksDetailModel copyWith({
    int? id,
    String? name,
    String? author,
    String? image,
    num? price,
    String? ratings,
    String? details,
  }) {
    return BooksDetailModel(
      id: id ?? this.id,
      name: name ?? this.name,
      author: author ?? this.author,
      image: image ?? this.image,
      price: price ?? this.price,
      ratings: ratings ?? this.ratings,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'author': author,
      'image': image,
      'price': price,
      'ratings': ratings,
      'details': details,
    };
  }

  factory BooksDetailModel.fromMap(Map<String, dynamic> map) {
    return BooksDetailModel(
      id: map['id'] as int,
      name: map['name'] as String,
      author: map['author'] as String,
      image: map['image'] as String,
      price: map['price'] as num,
      ratings: map['ratings'] as String,
      details: map['details'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BooksDetailModel.fromJson(String source) => BooksDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BooksDetailModel(id: $id, name: $name, author: $author, image: $image, price: $price, ratings: $ratings, details: $details)';
  }

  @override
  bool operator ==(covariant BooksDetailModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.author == author &&
      other.image == image &&
      other.price == price &&
      other.ratings == ratings &&
      other.details == details;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      author.hashCode ^
      image.hashCode ^
      price.hashCode ^
      ratings.hashCode ^
      details.hashCode;
  }
}
