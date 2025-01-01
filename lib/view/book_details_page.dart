import 'package:flutter/material.dart';
import 'package:languages_project/service/get_book_details_service.dart';

class BookDetailsPage extends StatelessWidget {
  BookDetailsPage({
    super.key,
    required this.id,
  });
  int id;
  // String idbook;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: getBooksDetailes(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Card(
                
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        )

        //  Center(
        //     child: Text(
        //   "Books ${id}",
        //   style: TextStyle(fontSize: 30),
        // )
        // ),
        );
  }
}
