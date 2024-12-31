// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LogInModel {
 final String phone;
    final String password;
  LogInModel({
    required this.phone,
    required this.password,
  });



  LogInModel copyWith({
    String? phone,
    String? password,
  }) {
    return LogInModel(
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'password': password,
    };
  }

  factory LogInModel.fromMap(Map<String, dynamic> map) {
    return LogInModel(
      phone: map['phone'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LogInModel.fromJson(String source) => LogInModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LogInModel(phone: $phone, password: $password)';

}
