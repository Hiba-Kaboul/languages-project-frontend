import 'package:dio/dio.dart';
import 'package:languages_project/config/service_locator.dart';
import 'package:languages_project/model/get_stores_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Store>> getStoresModel() async {
  try {
    Dio dio = Dio();
    Response response = await dio.get("http://127.0.0.1:8000/api/stores",
        options: Options(headers: {
          "Authorization":
              "Bearer ${servicelocator.get<SharedPreferences>().getString('token')}"
        }));
    print(response.data['stores']);
    List<Store> stores = List.generate(
      response.data['stores'].length,
      (index) => Store.fromMap(
        response.data['stores'][index],
      ),
    );
    print(stores.length);
    return stores;
  } catch (e) {
    print(e);
    throw e;
  }
}
