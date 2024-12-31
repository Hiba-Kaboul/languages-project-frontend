import 'package:dio/dio.dart';
import 'package:languages_project/config/service_locator.dart';
import 'package:languages_project/model/log_in_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

String token = "";
Future<bool> login(LogInModel login) async {
  try {
    Dio dio = Dio();
    Response response =
        await dio.post("http://127.0.0.1:8000/api/login", data: login.toMap());
    if (response.statusCode == 201) {
      token = response.data["Token"];
      
      servicelocator.get<SharedPreferences>().setString('token',token);
      print(token);
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}
