
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:languages_project/config/service_locator.dart';
import 'package:languages_project/view/bottom_navbar_page.dart';
import 'package:languages_project/view/splash_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setup();
  runApp(EasyLocalization(
    supportedLocales: [Locale('en', 'US'), Locale('ar', 'AR')],
    path: 'assets/translations', // <-- change the path of the translation files
    fallbackLocale: Locale('ar', 'AR'), child: const MyApp(),

    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(), // Wrap your app
    // ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      home: servicelocator.get<SharedPreferences>().getString('token') == null
          ? SplashPage()
          : BottomNavbarPage(),
    );
  }
}
