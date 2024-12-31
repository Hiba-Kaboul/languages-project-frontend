import 'package:flutter/material.dart';
import 'package:languages_project/service/log_out_service.dart';
import 'package:languages_project/view/log_in_page.dart';
import 'package:languages_project/view/profile_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("cart")),
       appBar: AppBar(),
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
            InkWell(onTap: () {
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
                    }else {
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
    );
  }
}
