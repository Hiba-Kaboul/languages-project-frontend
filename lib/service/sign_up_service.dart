import 'package:dio/dio.dart';
import 'package:languages_project/config/service_locator.dart';
import 'package:languages_project/model/sign_up_model.dart';
import 'package:languages_project/service/log_in_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> SignUp(SignUpModel SignUp) async {
  try {
    Dio dio = Dio();
    Response response = await dio.post("http://127.0.0.1:8000/api/register",
        data: SignUp.toMap());

    if (response.statusCode == 201) {
      token = response.data['token'];
      servicelocator.get<SharedPreferences>().setString('token',token);
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}
