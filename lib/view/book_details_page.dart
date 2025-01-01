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
              return SizedBox(
                width: 500,
                height: 700,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  surfaceTintColor: Colors.cyan,
                  elevation: 20,
                  shadowColor: const Color.fromARGB(255, 168, 124, 176),
                  borderOnForeground: true,
                  child: Column(
                    children: [
                      Container(
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage("http://127.0.0.1:8000" +
                                    snapshot.data!.image+"${id}"),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 350),
                        child: Text(
                          snapshot.data!.name+"${id}",
                          style: TextStyle(
                              //fontSize: 35,
                              ),
                        ),
                      ),
                      Text(
                        snapshot.data!.author+"${id}",
                        style: TextStyle(
                          // fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 260.0),
                        child: Text(
                          snapshot.data!.price+"${id}",
                          style: TextStyle(
                            // fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 260.0),
                        child: Text(
                          snapshot.data!.ratings+"${id}",
                          style: TextStyle(
                            //fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 260.0),
                        child: Text(
                          snapshot.data!.details+"${id}",
                          style: TextStyle(
                            // fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Text("add to cart",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.cyan),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text("add to favorait",
                                  style: TextStyle(
                                    color: Colors.cyan,
                                    fontSize: 20,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )


        );
  }
}
        //  Center(
        //     child: Text(
        //   "Books ${id}",
        //   style: TextStyle(fontSize: 30),
        // )
        // ),