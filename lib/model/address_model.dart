// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// class AddressModel {
//   String message;
//   String user_address;
//   AddressModel({
//     required this.message,
//     required this.user_address,
//   });

//   AddressModel copyWith({
//     String? message,
//     String? user_address,
//   }) {
//     return AddressModel(
//       message: message ?? this.message,
//       user_address: user_address ?? this.user_address,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'message': message,
//       'user_address': user_address,
//     };
//   }

//   factory AddressModel.fromMap(Map<String, dynamic> map) {
//     return AddressModel(
//       message: map['message'] as String,
//       user_address: map['user_address'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'AddressModel(message: $message, user_address: $user_address)';

//   @override
//   bool operator ==(covariant AddressModel other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.message == message &&
//       other.user_address == user_address;
//   }

//   @override
//   int get hashCode => message.hashCode ^ user_address.hashCode;
// }




// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// class BooksDetailModel {
//   int id;
//   String name;
//   String author;
//   String image;
//   num price;
//   String ratings;
//   String details;
//   BooksDetailModel({
//     required this.id,
//     required this.name,
//     required this.author,
//     required this.image,
//     required this.price,
//     required this.ratings,
//     required this.details,
//   });

//   BooksDetailModel copyWith({
//     int? id,
//     String? name,
//     String? author,
//     String? image,
//     num? price,
//     String? ratings,
//     String? details,
//   }) {
//     return BooksDetailModel(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       author: author ?? this.author,
//       image: image ?? this.image,
//       price: price ?? this.price,
//       ratings: ratings ?? this.ratings,
//       details: details ?? this.details,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'author': author,
//       'image': image,
//       'price': price,
//       'ratings': ratings,
//       'details': details,
//     };
//   }

//   // factory BooksDetailModel.fromMap(Map<String, dynamic> map) {
//   //   return BooksDetailModel(
//   //     id: map['id'] as int,
//   //     name: map['name'] as String,
//   //     author: map['author'] as String,
//   //     image: map['image'] as String,
//   //     price: map['price'] as num,
//   //     ratings: map['ratings'] as String,
//   //     details: map['details'] as String,
//   //   );
//   // }
//   factory BooksDetailModel.fromMap(Map<String, dynamic> map) {
//   if (map.containsKey('data') && map['data'] is Map<String, dynamic>) {
//     map = map['data'] as Map<String, dynamic>;
//   }

//   return BooksDetailModel(
//     id: map['id'] as int,
//     name: map['name'] as String,
//     author: map['author'] as String,
//     image: map['image'] as String,
//     price: map['price'] as num,
//     ratings: map['ratings'] as String,
//     details: map['details'] as String,
//   );
// }

//   String toJson() => json.encode(toMap());

//   factory BooksDetailModel.fromJson(String source) => BooksDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'BooksDetailModel(id: $id, name: $name, author: $author, image: $image, price: $price, ratings: $ratings, details: $details)';
//   }

//   @override
//   bool operator ==(covariant BooksDetailModel other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.id == id &&
//       other.name == name &&
//       other.author == author &&
//       other.image == image &&
//       other.price == price &&
//       other.ratings == ratings &&
//       other.details == details;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//       name.hashCode ^
//       author.hashCode ^
//       image.hashCode ^
//       price.hashCode ^
//       ratings.hashCode ^
//       details.hashCode;
//   }
// }
