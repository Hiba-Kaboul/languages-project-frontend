import 'package:flutter/material.dart';

import 'package:languages_project/service/get_type_service.dart';
import 'package:languages_project/view/book_details_page.dart';
import 'package:languages_project/view/books_page.dart';

class TypesPage extends StatelessWidget {
  TypesPage({super.key, required this.id});
  int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff90CDF9),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_active_outlined)),
          )
        ],
      ),
      body: FutureBuilder(
        future: getBookType(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 5 / 6,
              ),
              itemCount: snapshot.data!.type.length,
              itemBuilder: (context, index) {
                return InkWell(

                  onTap: () {
                  print(index);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BooksPage(id: (id+1).toString(),type:snapshot.data!.type[index]),
                        
                        ));
                          
                  },
                  child: Card(
                    elevation: 10,
                    shadowColor: Color(0xff90CDF9),
                    color: Color(0xff90CDF9),
                    child: Center(
                      child: Text(
                        snapshot.data!.type[index],
                      ),
                    ),
                  ),
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
