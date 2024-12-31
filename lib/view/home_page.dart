import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:languages_project/service/get_stores_service.dart';
import 'package:languages_project/service/log_out_service.dart';
import 'package:languages_project/view/log_in_page.dart';
import 'package:languages_project/view/profile_page.dart';
import 'package:languages_project/view/types_page.dart';

///////////////////////////
class HomePage extends StatelessWidget {
  HomePage({super.key});

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
                icon: Icon(Icons.notifications_active_outlined)),
          )
        ],
      ),
      drawer: Drawer(
        surfaceTintColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 150, 151, 152),
        shadowColor: Color(0xff90CDF9),
        elevation: 20,
        shape: RoundedRectangleBorder(),
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff90CDF9),
                ),
                accountName: Text("hiba Kaboul"),
                accountEmail: Text("hiba@gmail.com")),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ));
              },
              child: const ListTile(
                title: Text('Profile'),
                leading: Icon(Icons.person),
              ),
            ),
            const ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
            ),
            const ListTile(
              title: Text('Langauge'),
              leading: Icon(Icons.language),
            ),
            const ListTile(
              title: Text('Theme'),
              leading: Icon(Icons.dark_mode),
            ),
            const SizedBox(
              height: 200,
            ),
            ListTile(
              title: TextButton(
                  style: TextButton.styleFrom(),
                  onPressed: () async {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => LogInPage(),
                    //     ));

                    bool status = await logout();

                    if (status) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Log out Successfuly"),
                        backgroundColor: Colors.green,
                      ));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LogInPage(),
                          ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Log out Not Successfuly"),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  child: const Text("Log Out")),
              leading: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: SizedBox(
          child: Column(
            children: [
              Container(
                width: 350,
                height: 180,
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   fit: BoxFit.cover,image: AssetImage("asset/images.jpg")
                    //   ),
                    color: Color.fromARGB(135, 144, 205, 249),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 50),
                      child: Column(
                        children: [
                          Text(
                            "Welcome to BookNest !",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          Gap(4),
                          Text(
                            " your ultimate destination for",
                            style: TextStyle(fontSize: 13),
                          ),
                          Text("discovering and purchasing"),
                          Text("your favorite books!"),
                        ],
                      ),
                    ),
                    Gap(20),
                    Image.asset(
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                        "images/Group.png")
                    // Container(
                    //   width: 100,
                    //   height: 100,
                    //   decoration: BoxDecoration(
                    //       image: const DecorationImage(
                    //           fit: BoxFit.contain,
                    //           image: AssetImage("asset/Group.png")),
                    //       borderRadius: BorderRadius.circular(20)),
                    // )
                  ],
                ),
              ),
              Center(
                child: FutureBuilder(
                  future: getStoresModel(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        // ? Make the grid View Reposnsive
                        height: MediaQuery.of(context).size.height/2.2,
                        child: GridView.builder(
                          padding: const EdgeInsets.all(10),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 5 / 6,
                          ),
                          itemCount: snapshot.data!.stores.length,
                          itemBuilder: (context, index) {
                            
                            return InkWell(onTap: () {
                                                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TypesPage(id: index,),
                      ));
                            },
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: Image.network(
                                        "http://127.0.0.1:8000" +
                                            snapshot.data!.stores[index].image,
                                        fit: BoxFit.fill,
                                      ).image),
                                ),
                                child: Container(
                                  color: Color(0xff90CDF9),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            snapshot.data!.stores[index].name),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



