// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:languages_project/service/profile_service.dart';

// // استيراد الملف الذي يحتوي على الخدمة

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   File? image;
//   final ImagePicker _picker = ImagePicker();
//   final ApiService _apiService = ApiService(); // استخدام الخدمة
// //  String addAddress="address";
//   @override
//   void initState() {
//     super.initState();
//     // يمكنك هنا استدعاء أي دالة من ApiService مثل getUserInfo
//   }

//   // اختيار صورة من المعرض
//   Future<void> getImage() async {
//     final pickedFile = await _picker.pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 80,
//     );

//     if (pickedFile != null) {
//       setState(() {
//         image = File(pickedFile.path);
//       });
//       // إرسال الصورة إلى الخادم باستخدام الخدمة
//       await _apiService.uploadProfileImage(image!);
//     } else {
//       print('No image selected.');
//     }
//   }

//   // حذف الصورة من الخادم
//   Future<void> deleteImage() async {
//     await _apiService.deleteProfileImage();
//   }

//   TextEditingController address =TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             image != null
//                 ? Image.file(image!, width: 100, height: 100)
//                 : Icon(Icons.account_circle, size: 100),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: getImage,
//               child: Text('Pick Image'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: deleteImage,
//               child: Text('Delete Image'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 await _apiService.getUserInfo(); // لاسترجاع معلومات المستخدم
//               },
//               child: Text('Get User Info'),
//             ),
//             TextField(
//               controller: address,
//               decoration: InputDecoration(),),
//             SizedBox(height: 20),
//             ElevatedButton(onPressed: ()async{await _apiService.addAddress(address.text);}, child: Text("add address"))///////////////////////
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:languages_project/service/profile_service.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserService userService = UserService();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    await userService.loadUserData(); // تحميل البيانات من SharedPreferences
    final user = userService.getCurrentUser();
    if (user != null) {
      firstNameController.text = user.firstName;
      lastNameController.text = user.lastName;
      phoneController.text = user.phoneNumber;
      addressController.text = user.address;
      setState(() {});
    }
  }

  void saveUserData() async {
    await userService.updateUser(
      firstNameController.text,
      lastNameController.text,
      phoneController.text,
      addressController.text,
      // هنا يمكنك إضافة رابط الصورة إذا كان لديك
    );
    setState(() {});
  }

  void deleteImage() {
    userService.deleteProfileImage();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final user = userService.getCurrentUser();

    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: user?.profileImageUrl?.isNotEmpty == true
                  ? NetworkImage(user!.profileImageUrl!)
                  : null,
              child: user?.profileImageUrl?.isEmpty == true
                  ? Icon(Icons.person, size: 50)
                  : null,
            ),
            SizedBox(height: 16),
            Container(
              height: 44,
              width: 346,
              child: TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 44,
              width: 346,
              child: TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 44,
              width: 346,
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 44,
              width: 346,
              child: TextField(
                controller: addressController,
                decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: saveUserData,
              child: Text('Save'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: deleteImage,
              child: Text('Delete Profile Image'),
            ),
          ],
        ),
      ),
    );
  }
}
