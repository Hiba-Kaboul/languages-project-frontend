import 'package:flutter/material.dart';
import 'package:languages_project/model/log_in_model.dart';
import 'package:languages_project/service/log_in_service.dart';
import 'package:languages_project/view/bottom_navbar_page.dart';
import 'package:languages_project/view/sign_up_page.dart';

class LogInPage extends StatefulWidget {
  LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController phone_number = TextEditingController();

  TextEditingController password = TextEditingController();

  bool? check = true;
  bool hidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff90CDF9),
            ),
            height: 350,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
                Image.asset(
                  "images/Group.png",
                  width: 600,
                  height: 200,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 346,
            height: 44,
            child: TextField(
              controller: phone_number,
              decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Color(0xff8F9BB3)),
                  prefixIcon: const Icon(
                    Icons.phone_iphone,
                    color: Color(0xff8F9BB3),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter Phone Number"),
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          Container(
            width: 346,
            height: 44,
            child: TextField(
              controller: password,
              obscureText: hidden,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Color(0xff8F9BB3)),
                  prefixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        hidden = !hidden;
                      });
                    },
                    child: const Icon(
                      Icons.lock_open_outlined,
                      color: Color(0xff8F9BB3),
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter Password"),
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 150),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    activeColor: Color(0xff90CDF9),
                    value: check,
                    onChanged: (bool? checkvalue) {
                      setState(() {
                        check = checkvalue;
                      });
                    }),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  "I read and accept Privacy",
                  style: TextStyle(color: Color(0xff21B4BD)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          ElevatedButton(
            onPressed: () async {
         
              bool status = await login(LogInModel(
                  phone: phone_number.text, password: password.text));
              if (status) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("login successfully"),
                  backgroundColor: Colors.green,
                ));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavbarPage(),
                    ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("login failed"),
                  backgroundColor: Colors.red,
                ));
              }
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => HomePage(),
              //     ));
            },
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Color(0xff90CDF9),
              minimumSize: Size(346, 44),
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 160),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ));
                },
                child: const Text(
                  "I don’t have account.",
                  style: TextStyle(color: Color(0xffF81414)),
                )),
          )
        ],
      ),
    );
  }
}
