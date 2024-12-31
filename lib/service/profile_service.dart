import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'http://127.0.0.1:8000/api'; // رابط الـ API

  // دالة لتحميل صورة الملف الشخصي
  Future<void> uploadProfileImage(File image) async {
    // الحصول على التوكن من SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token'); // التوكن المخزن في SharedPreferences

    if (token == null) {
      print('No token found.');
      return;
    }

    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(image.path), // تحميل الصورة
      });

      final response = await _dio.post(
        '$baseUrl/addProfileImage',
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token', // إضافة التوكن في الترويسة
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        print('Failed to upload image: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  // دالة للحصول على معلومات المستخدم
  Future<void> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token'); // التوكن المخزن في SharedPreferences

    if (token == null) {
      print('No token found.');
      return;
    }

    try {
      final response = await _dio.get(
        '$baseUrl/getUserInfo',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('User Info: ${response.data}');
      } else {
        print('Failed to fetch user info: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error fetching user info: $e');
    }
  }

  // دالة لحذف صورة الملف الشخصي
  Future<void> deleteProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token'); // التوكن المخزن في SharedPreferences

    if (token == null) {
      print('No token found.');
      return;
    }

    try {
      final response = await _dio.delete(
        '$baseUrl/deleteProfileImage',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Profile image deleted successfully');
      } else {
        print('Failed to delete profile image: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error deleting profile image: $e');
    }
  }

  // دالة لإضافة عنوان جديد
  Future<void> addAddress(String address) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token'); // التوكن المخزن في SharedPreferences

    if (token == null) {
      print('No token found.');
      return;
    }

    try {

      print({
        "address":address
      });

      final response = await _dio.post(
        '$baseUrl/address',
        data: {
        'address': address, // إضافة عنوان جديد
      },
        options: Options(
          headers: {
            // 'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      

      if (response.statusCode == 200) {
        print('Address added successfully');
      } else {
        print('Failed to add address: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error adding address: $e');
    }
  }
}