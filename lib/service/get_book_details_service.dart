

import 'package:dio/dio.dart';
import 'package:languages_project/config/service_locator.dart';
import 'package:languages_project/model/books_detail_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<BooksDetailModel>> getBooksDetailes(int idbook) async {

  try {
  Dio dio = Dio();
  Response response = await dio.get(
    "http://127.0.0.1:8000/api/bookDetail/${idbook}",
    options: Options(
      headers: {
        "Authorization":
            "Bearer ${servicelocator.get<SharedPreferences>().getString('token')}",
      },
    ),
  );
  List<BooksDetailModel> details = [];
  for (var i = 0; i < response.data.length; i++) {
    BooksDetailModel booksdetails = BooksDetailModel.fromMap(response.data[i]);
    details.add(booksdetails);
  }

  return details;
    
  } catch (e) {
    print(e);
    return [];
  }
}