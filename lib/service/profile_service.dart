// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ApiService {
//   final Dio _dio = Dio();
//   final String baseUrl = 'http://127.0.0.1:8000/api'; // رابط الـ API

//   // دالة لتحميل صورة الملف الشخصي
//   Future<void> uploadProfileImage(File image) async {
//     // الحصول على التوكن من SharedPreferences
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token'); // التوكن المخزن في SharedPreferences

//     if (token == null) {
//       print('No token found.');
//       return;
//     }

//     try {
//       final formData = FormData.fromMap({
//         'image': await MultipartFile.fromFile(image.path), // تحميل الصورة
//       });

//       final response = await _dio.post(
//         '$baseUrl/addProfileImage',
//         data: formData,
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $token', // إضافة التوكن في الترويسة
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         print('Image uploaded successfully');
//       } else {
//         print('Failed to upload image: ${response.statusMessage}');
//       }
//     } catch (e) {
//       print('Error uploading image: $e');
//     }
//   }

//   // دالة للحصول على معلومات المستخدم
//   Future<void> getUserInfo() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token'); // التوكن المخزن في SharedPreferences

//     if (token == null) {
//       print('No token found.');
//       return;
//     }

//     try {
//       final response = await _dio.get(
//         '$baseUrl/getUserInfo',
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $token',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         print('User Info: ${response.data}');
//       } else {
//         print('Failed to fetch user info: ${response.statusMessage}');
//       }
//     } catch (e) {
//       print('Error fetching user info: $e');
//     }
//   }

//   // دالة لحذف صورة الملف الشخصي
//   Future<void> deleteProfileImage() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token'); // التوكن المخزن في SharedPreferences

//     if (token == null) {
//       print('No token found.');
//       return;
//     }

//     try {
//       final response = await _dio.delete(
//         '$baseUrl/deleteProfileImage',
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $token',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         print('Profile image deleted successfully');
//       } else {
//         print('Failed to delete profile image: ${response.statusMessage}');
//       }
//     } catch (e) {
//       print('Error deleting profile image: $e');
//     }
//   }

//   // دالة لإضافة عنوان جديد
//   Future<void> addAddress(String address) async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token'); // التوكن المخزن في SharedPreferences

//     if (token == null) {
//       print('No token found.');
//       return;
//     }

//     try {

//       print({
//         "address":address
//       });

//       final response = await _dio.post(
//         '$baseUrl/address',
//         data: {
//         'address': address, // إضافة عنوان جديد
//       },
//         options: Options(
//           headers: {
//             // 'Accept': 'application/json',
//             'Authorization': 'Bearer $token',
//           },
//         ),
//       );


//       if (response.statusCode == 200) {
//         print('Address added successfully');
//       } else {
//         print('Failed to add address: ${response.statusMessage}');
//       }
//     } catch (e) {
//       print('Error adding address: $e');
//     }
//   }
// }

import 'package:languages_project/model/profile_addimage_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  User? _currentUser;

  Future<void> updateUser(String firstName, String lastName, String phoneNumber, String address, {String? profileImageUrl}) async {
    _currentUser = User(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      address: address,
      profileImageUrl: profileImageUrl,
    );

    // حفظ البيانات في SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', firstName);
    await prefs.setString('lastName', lastName);
    await prefs.setString('phoneNumber', phoneNumber);
    await prefs.setString('address', address);
    await prefs.setString('profileImageUrl', profileImageUrl ?? '');
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? firstName = prefs.getString('firstName');
    String? lastName = prefs.getString('lastName');
    String? phoneNumber = prefs.getString('phoneNumber');
    String? address = prefs.getString('address');
    String? profileImageUrl = prefs.getString('profileImageUrl');

    if (firstName != null && lastName != null && phoneNumber != null && address != null) {
      _currentUser = User(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        address: address,
        profileImageUrl: profileImageUrl,
      );
    }
  }

  void deleteProfileImage() {
    if (_currentUser != null) {
      _currentUser!.profileImageUrl = null;
    }
  }

  User? getCurrentUser() {
    return _currentUser;
  }
}
