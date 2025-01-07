import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:languages_project/model/sign_up_model.dart';
import 'package:languages_project/service/sign_up_service.dart';
import 'package:languages_project/view/bottom_navbar_page.dart';
import 'package:languages_project/view/log_in_page.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isHide = true;
  bool IsHide = true;

  final TextEditingController firstcontroller = TextEditingController();

  final TextEditingController lastcontroller = TextEditingController();

  final TextEditingController phonecontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  final TextEditingController passwordagaincontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 290,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xff90CDF9)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gap(10),
                     Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ).tr(),
                    ),
                    Image.asset(width: 150, height: 150, "images/Group.png")
                  ],
                ),
              ),
            ),
            Gap(20),
            Container(
              width: 370,
              height: 60,
              child: TextField(
                controller: firstcontroller,
                decoration:  InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide()),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xff8F9BB3),
                    ),
                    hintText: "Enter Your First Name".tr(),
                    hintStyle: TextStyle(
                        color: Color(0xff8F9BB3),
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
              )
            ),
            Gap(10),
            Container(
              width: 370,
              height: 60,
              child: TextField(
              
                controller: lastcontroller,
                decoration:  InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide()),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xff8F9BB3),
                    ),
                    hintText: "Enter Your Last Name".tr(),
                    hintStyle: TextStyle(
                        color: Color(0xff8F9BB3),
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Gap(10),
            Container(
              width: 370,
              height: 60,
              child: TextField(
                controller: phonecontroller,
                decoration:  InputDecoration(border: OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide()),
                    prefixIcon: Icon(
                      Icons.phone_android_rounded,
                      color: Color(0xff8F9BB3),
                    ),
                    hintText: "Enter Your Phone Number".tr(),
                    hintStyle: TextStyle(
                        color: Color(0xff8F9BB3),
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Gap(10),
            Container(
              width: 370,
              height: 60,
              child: TextField(
                controller: passwordcontroller,
                obscureText: isHide,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide()),
                    prefixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isHide = !isHide;
                        });
                      },
                      child: isHide
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              color: Color(0xff8F9BB3),
                            )
                          : const Icon(
                              Icons.remove_red_eye_outlined,
                              color: Color(0xff8F9BB3),
                            ),
                    ),
                    hintText: "Enter Your Password".tr(),
                    hintStyle: const TextStyle(
                        color: Color(0xff8F9BB3),
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Gap(10),
            Container(
              width: 370,
              height: 60,
              child: TextField(
                controller: passwordagaincontroller,
                obscureText: IsHide,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide()),
                    prefixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          IsHide = !IsHide;
                        });
                      },
                      child: IsHide
                          ? const Icon(
                              Icons.lock_outlined,
                              color: Color(0xff8F9BB3),
                            )
                          : const Icon(
                              Icons.lock_open_rounded,
                              color: Color(0xff8F9BB3),
                            ),
                    ),
                    hintText: "Enter Your Passowrd again".tr(),
                    hintStyle: const TextStyle(
                        color: Color(0xff8F9BB3),
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Gap(10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff90CDF9),
                    maximumSize: Size(346, 44)),
                onPressed: () async {bool status = await SignUp(SignUpModel(
                    first_name: firstcontroller.text,
                    last_name: lastcontroller.text,
                    phone: phonecontroller.text,
                    password: passwordcontroller.text,
                    password_confirmation: passwordagaincontroller.text,
                  ));
                  if (status) {
                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                      content: Text("Sign Up Successfuly").tr(),
                      backgroundColor: Colors.green,));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavbarPage(),
                        ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                      content: Text("There is a Mistack").tr(),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child:  Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ).tr(),
                )),
            Gap(15),
            Padding(
              padding: const EdgeInsets.only(left: 200.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LogInPage(),
                        ));
                  },
                  child:  Text(
                    "I have account already ".tr(),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff21B4BD)),
                  ).tr(),
                  ),
            )
          ],
        ),
      ),
    );
  }
}