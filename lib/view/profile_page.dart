import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:languages_project/service/profile_service.dart';

// استيراد الملف الذي يحتوي على الخدمة

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? image;
  final ImagePicker _picker = ImagePicker();
  final ApiService _apiService = ApiService(); // استخدام الخدمة
//  String addAddress="address";
  @override
  void initState() {
    super.initState();
    // يمكنك هنا استدعاء أي دالة من ApiService مثل getUserInfo
  }

  // اختيار صورة من المعرض
  Future<void> getImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      // إرسال الصورة إلى الخادم باستخدام الخدمة
      await _apiService.uploadProfileImage(image!);
    } else {
      print('No image selected.');
    }
  }

  // حذف الصورة من الخادم
  Future<void> deleteImage() async {
    await _apiService.deleteProfileImage();
  }

  TextEditingController address =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            image != null
                ? Image.file(image!, width: 100, height: 100)
                : Icon(Icons.account_circle, size: 100),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: getImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: deleteImage,
              child: Text('Delete Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _apiService.getUserInfo(); // لاسترجاع معلومات المستخدم
              },
              child: Text('Get User Info'),
            ),
            TextField(
              controller: address,
              decoration: InputDecoration(),),
            SizedBox(height: 20),
            ElevatedButton(onPressed: ()async{await _apiService.addAddress(address.text);}, child: Text("add address"))///////////////////////
          ],
        ),
      ),
    );
  }
}
