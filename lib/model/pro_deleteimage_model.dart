// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// class ProDeleteimageModel {
//   String message;
//   ProDeleteimageModel({
//     required this.message,
//   });

//   ProDeleteimageModel copyWith({
//     String? message,
//   }) {
//     return ProDeleteimageModel(
//       message: message ?? this.message,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'message': message,
//     };
//   }

//   factory ProDeleteimageModel.fromMap(Map<String, dynamic> map) {
//     return ProDeleteimageModel(
//       message: map['message'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ProDeleteimageModel.fromJson(String source) => ProDeleteimageModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'ProDeleteimageModel(message: $message)';

//   @override
//   bool operator ==(covariant ProDeleteimageModel other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.message == message;
//   }

//   @override
//   int get hashCode => message.hashCode;
// }
