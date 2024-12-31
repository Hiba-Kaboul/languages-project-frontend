// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetUserinfoMode {
  String first_name;
  String last_name;
  String phone;
  GetUserinfoMode({
    required this.first_name,
    required this.last_name,
    required this.phone,
  });

  GetUserinfoMode copyWith({
    String? first_name,
    String? last_name,
    String? phone,
  }) {
    return GetUserinfoMode(
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': first_name,
      'last_name': last_name,
      'phone': phone,
    };
  }

  factory GetUserinfoMode.fromMap(Map<String, dynamic> map) {
    return GetUserinfoMode(
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetUserinfoMode.fromJson(String source) => GetUserinfoMode.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GetUserinfoMode(first_name: $first_name, last_name: $last_name, phone: $phone)';

  @override
  bool operator ==(covariant GetUserinfoMode other) {
    if (identical(this, other)) return true;
  
    return 
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.phone == phone;
  }

  @override
  int get hashCode => first_name.hashCode ^ last_name.hashCode ^ phone.hashCode;
}
