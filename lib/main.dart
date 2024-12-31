import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:languages_project/config/service_locator.dart';
import 'package:languages_project/view/bottom_navbar_page.dart';
import 'package:languages_project/view/splash_page.dart';
import 'package:languages_project/view/types_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {

WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: servicelocator.get<SharedPreferences>().getString('token')==null ? SplashPage() : BottomNavbarPage(),
    );
  }
}
