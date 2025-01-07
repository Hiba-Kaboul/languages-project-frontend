import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:languages_project/view/log_in_page.dart';
import 'package:languages_project/view/sign_up_page.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff90CDF9),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
               // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(40),
                  const Image(image: AssetImage("images/Group.png")),
                  Gap(40),
                  const Text(
                    "Welcome ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ).tr(),
                  Gap(15),
                  const Text(
                    "read without limit ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ).tr(),
                  Gap(40),
                  FilledButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.grey,
                          maximumSize: Size(346, 44),
                          backgroundColor: Colors.white),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ));
                      },
                      child:  Center(
                        child: Text(
                          "create account",
                          style: TextStyle(
                              color: Color(0xff90CDF9),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ).tr(),
                      )),
                  const Gap(40),
                  Container(
                    decoration: BoxDecoration(),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        maximumSize: Size(346, 44),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LogInPage(),
                            ));
                      },
                      child:  Center(
                        child: Text("Log in",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500)
                                ).tr(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
