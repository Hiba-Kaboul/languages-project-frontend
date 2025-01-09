import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:languages_project/service/get_books_service.dart';
import 'package:languages_project/view/book_details_page.dart';

class BooksPage extends StatelessWidget {
  BooksPage({super.key, required this.id, required this.type});
  String id;
  String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff90CDF9),
      ),
      body: FutureBuilder(
        future: getBooksModel(id, type),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                print(id);
                return SizedBox(
                  height: 100,
                  child: Card(
                    surfaceTintColor: Color(0xff90CDF9),
                    elevation: 10,
                    shadowColor: Color(0xff90CDF9),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Container(
                          //   width: 90,
                          //   height: 70,
                          //   // alignment: Alignment.centerLeft,
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         image: NetworkImage(
                          //           "http://127.0.0.1:8000" +
                          //               snapshot.data![index].image,
                          //         ),

                          //         fit: BoxFit.fill,
                          //         onError: (exception, stackTrace) {

                          //         },),
                          //     // border: Border.all(
                          //     //   color: const Color(0xffaabedf),
                          //     // ),
                          //     borderRadius: BorderRadius.circular(12),
                          //   ),
                          // ),
                          Image.network(
                            width: 90,
                            height: 70,
                            fit: BoxFit.fill,
                            "http://127.0.0.1:8000" +
                                snapshot.data![index].image,
                            errorBuilder: (context, error, stackTrace) {
                              // return Image.asset(
                              //   "asset/images.jpg",
                              //   width: 90,
                              //   height: 70,
                              // );
                              return FlutterLogo();
                            },
                          ),
                          Gap(50),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index].name,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 3, bottom: 3, right: 10),
                                child: Text(
                                  "author : " + snapshot.data![index].author,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 62, 56, 56),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "price : " +
                                        snapshot.data![index].price.toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff90CDF9),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                  ),
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          // backgroundBuilder:Colors.cyan
                                          ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BookDetailsPage(
                                                id:snapshot.data![index].id,
                                              ),
                                            ));
                                      },
                                      child: const Center(
                                        child: Text(
                                          "Details",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                255, 77, 138, 181),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ],
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
