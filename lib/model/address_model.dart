// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddressModel {
  String message;
  String user_address;
  AddressModel({
    required this.message,
    required this.user_address,
  });

  AddressModel copyWith({
    String? message,
    String? user_address,
  }) {
    return AddressModel(
      message: message ?? this.message,
      user_address: user_address ?? this.user_address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'user_address': user_address,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      message: map['message'] as String,
      user_address: map['user_address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddressModel(message: $message, user_address: $user_address)';

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message &&
      other.user_address == user_address;
  }

  @override
  int get hashCode => message.hashCode ^ user_address.hashCode;
}
