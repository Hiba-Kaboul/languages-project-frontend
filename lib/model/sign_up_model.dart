// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpModel {
    final String first_name;
    final String last_name;
    final String phone;
    final String password;
    final String password_confirmation;
  SignUpModel({
    required this.first_name,
    required this.last_name,
    required this.phone,
    required this.password,
    required this.password_confirmation,
  });

  SignUpModel copyWith({
    String? first_name,
    String? last_name,
    String? phone,
    String? password,
    String? password_confirmation,
  }) {
    return SignUpModel(
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      password_confirmation: password_confirmation ?? this.password_confirmation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': first_name,
      'last_name': last_name,
      'phone': phone,
      'password': password,
      'password_confirmation': password_confirmation,
    };
  }

  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
      phone: map['phone'] as String,
      password: map['password'] as String,
      password_confirmation: map['password_confirmation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromJson(String source) => SignUpModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignUpModel(first_name: $first_name, last_name: $last_name, phone: $phone, password: $password, password_confirmation: $password_confirmation)';
  }

}
