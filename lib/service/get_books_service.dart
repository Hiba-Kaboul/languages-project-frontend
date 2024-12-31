
import 'package:dio/dio.dart';
import 'package:languages_project/config/service_locator.dart';
import 'package:languages_project/model/get_books_model.dart';
import 'package:shared_preferences/shared_preferences.dart';



Future<List<GetBooksModel>> getBooksModel(String id,String type) async {

  try {
  Dio dio = Dio();
  Response response = await dio.get(
    "http://127.0.0.1:8000/api/books/${id}/${type}",
    options: Options(
      headers: {
        "Authorization":
            "Bearer ${servicelocator.get<SharedPreferences>().getString('token')}",
      },
    ),
  );
  List<GetBooksModel> books = [];
  for (var i = 0; i < response.data.length; i++) {
    GetBooksModel typesByStore = GetBooksModel.fromMap(response.data[i]);
    books.add(typesByStore);
  }

  return books;
    
  } catch (e) {
    print(e);
    return [];
  }
}