// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfileAddimageModel {
String message;
String user_image;
  ProfileAddimageModel({
    required this.message,
    required this.user_image,
  });



  ProfileAddimageModel copyWith({
    String? message,
    String? user_image,
  }) {
    return ProfileAddimageModel(
      message: message ?? this.message,
      user_image: user_image ?? this.user_image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'user_image': user_image,
    };
  }

  factory ProfileAddimageModel.fromMap(Map<String, dynamic> map) {
    return ProfileAddimageModel(
      message: map['message'] as String,
      user_image: map['user_image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileAddimageModel.fromJson(String source) => ProfileAddimageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProfileAddimageModel(message: $message, user_image: $user_image)';

  @override
  bool operator ==(covariant ProfileAddimageModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message &&
      other.user_image == user_image;
  }

  @override
  int get hashCode => message.hashCode ^ user_image.hashCode;
}
