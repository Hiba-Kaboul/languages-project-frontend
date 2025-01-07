import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:languages_project/service/get_book_details_service.dart';
import 'package:languages_project/view/cart_page.dart';
import 'package:languages_project/view/favorite_page.dart';

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
        appBar: AppBar(
          backgroundColor: Color(0xff90CDF9),
        ),
        body: FutureBuilder(
          future: getBooksDetailes(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(id);
              return Center(
                child: SizedBox(
                  width: 500,
                  height: 800,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    surfaceTintColor: Colors.cyan,
                    elevation: 20,
                    shadowColor: const Color.fromARGB(255, 168, 124, 176),
                    borderOnForeground: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage("http://127.0.0.1:8000" +
                                      snapshot.data!.image),
                                  fit: BoxFit.fill)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20,right: 20),
                          child: Text(
                            "The book name : " + snapshot.data!.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ).tr(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35.0,right: 35),
                          child: Text(
                            "The auther : " + snapshot.data!.author,
                            style: const TextStyle(
                                   fontSize: 15,
                                      fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ).tr(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 35.0,right: 35),
                          child: Text(
                            "The price : " + snapshot.data!.price.toString(),
                            style: const TextStyle(
                                 fontSize: 15,
                                    fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ).tr(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 35.0,right: 35),
                          child: Text(
                            "The rating : " + snapshot.data!.ratings,
                            style: const TextStyle(
                              fontSize: 15,
                                 fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ).tr(),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 20),
                          child: Text(
                            "Over view :",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ).tr(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 35,right: 35),
                          child: Text(
                            snapshot.data!.details,
                            style: const TextStyle(
                               fontSize: 15,
                                fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ).tr(),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FilledButton(
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.grey,
                                      minimumSize: Size(50, 50),
                                      backgroundColor: Colors.white),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CartPage(),
                                        ));
                                  },
                                  child:  Center(
                                      child: const Text(
                                    "Add to cart",
                                    style: TextStyle(
                                        color: Color(0xff90CDF9),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ).tr(),
                                  )
                                  ),
                                  SizedBox(width: 20,),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.grey,
                                 minimumSize: Size(50, 50),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FavoritePage(),
                                      ));
                                },
                                child:  Center(
                                    child: const Text("Add to favorit",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)
                                            ).tr(),
                                            ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              print(Text(snapshot.error.toString()));
              return Text(snapshot.error.toString());
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}