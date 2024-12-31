import 'package:flutter/material.dart';
import 'package:languages_project/service/get_books_service.dart';
import 'package:languages_project/service/get_type_service.dart';
import 'package:languages_project/view/book_details_page.dart';

class BooksPage extends StatelessWidget {
  BooksPage({super.key, required this.id,required this.type});
  String id;
  String type;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getBooksModel(id,type),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                print(id);
                return ListTile(
                  leading: Image.network(
                    "http://127.0.0.1:8000" + snapshot.data![index].image,
                    fit: BoxFit.fill,
                  ),
                  title: Text(snapshot.data![index].name),
                  subtitle: Column(
                    children: [
                      Text(snapshot.data![index].author),
                      Text(snapshot.data![index].price),
                    ],
                  ),
                  trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookDetailsPage(id: index),
                            ));
                      },
                      child: Text("Details")),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
