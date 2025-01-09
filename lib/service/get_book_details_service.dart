import 'package:dio/dio.dart';
import 'package:languages_project/config/service_locator.dart';
import 'package:languages_project/model/books_detail_model.dart';


import 'package:shared_preferences/shared_preferences.dart';

Future<BooksDetailModel> getBooksDetailes(int id) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
      "http://127.0.0.1:8000/api/bookDetail/${id}",
      options: Options(
        headers: {
          "Authorization":
              "Bearer ${servicelocator.get<SharedPreferences>().getString('token')}",
        },
      ),
    );

    BooksDetailModel booksdetails = BooksDetailModel.fromMap(response.data["data"]);

    return booksdetails;
  } catch (e) {
    print(e);
    throw e;
  }
}
