import 'package:dio/dio.dart';
import 'package:languages_project/config/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

//  String token = "";
Future<bool> logout() async {
  try {
    print(servicelocator.get<SharedPreferences>().getString('token'));
    Dio dio = Dio();
    Response response = await dio.post(
      "http://127.0.0.1:8000/api/logout",
      options: Options(
        headers: {
          "Authorization":
              "Bearer ${servicelocator.get<SharedPreferences>().getString('token')}",
        },
      ),
    );
    print("Hello World");
    servicelocator.get<SharedPreferences>().clear();
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
