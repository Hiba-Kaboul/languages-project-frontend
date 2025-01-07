import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:languages_project/service/log_out_service.dart';
import 'package:languages_project/view/log_in_page.dart';


///////////////////////////
class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff90CDF9),
      ),
    drawer: Drawer(
        surfaceTintColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 150, 151, 152),
        shadowColor: Color(0xff90CDF9),
        elevation: 20,
        shape: const RoundedRectangleBorder(),
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff90CDF9),
                ),
                accountName: Text("hiba Kaboul"),
                accountEmail: Text("hiba@gmail.com")),
             ListTile(
              title: Text('Profile').tr(),
              leading: Icon(Icons.person),
            ),
             ListTile(
              title: Text('Settings').tr(),
              leading: Icon(Icons.settings),
            ),
            ExpansionTile(
              title:  Text("language").tr(),
              onExpansionChanged: (bool isExpencion) {
                print(isExpencion);
              },
              controlAffinity: ListTileControlAffinity.leading,
              tilePadding: EdgeInsets.all(50),
              expandedCrossAxisAlignment: CrossAxisAlignment.end,
              dense: false,
              shape: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              children: [
                TextButton(
                    onPressed: () {
                      if (context.locale.languageCode == 'ar') {
                        context.setLocale(Locale('en', 'US'));
                      }
                    },
                    child: Text("Enghlish Language").tr()
                    ),
                TextButton(
                    onPressed: () {
                      if (context.locale.languageCode == 'en') {
                        context.setLocale(Locale('ar', 'AR'));
                      }
                    },
                    child: Text("Arabic Language").tr()),
              ],
            ),
            // const ListTile(
            //   title: Text('Langauge'),
            //   leading: Icon(Icons.language),
            // ),
             ListTile(
              title: Text('Theme').tr(),
              leading: Icon(Icons.dark_mode),
            ),

            InkWell(
              onTap: () async{
                 
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
              child: ListTile(
                title: Text("Log Out").tr(),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Container(
          color: Colors.white,
          child: ListView.separated(
             itemCount: 15,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 100,
                  child: Card(
                    surfaceTintColor: const Color(0xff90CDF9),
                    elevation: 10,
                    shadowColor: const Color(0xff90CDF9),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 95,
                          height: 70,

                          // alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfaJgwmIZea1z7dthmh0dbbUD7vzFYuiPjHA&s',
                                ),
                                fit: BoxFit.fill),
                            // border: Border.all(
                            //   color: const Color(0xffaabedf),
                            // ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cookie Sandwich',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 3, bottom: 3),
                              child: Text(
                                'Restaurant Name',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 62, 56, 56),
                                ),
                              ),
                            ),
                            Text(
                              '85000 SYP',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff028174),
                              ),
                            ),
                          ],
                        ),Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_outlined,
                                color: Color(0xff90CDF9),
                                size: 22,
                              ),
                              style: ElevatedButton.styleFrom(
                                // backgroundColor: Colors.white70,
                                fixedSize: const Size(25, 25),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            // const SizedBox(
                            //   width: 3,
                            // ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Color(0xff90CDF9),
                                size: 20,
                              ),
                              style: ElevatedButton.styleFrom(
                                // backgroundColor: Colors.white70,
                                fixedSize: const Size(25, 25),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox();
              },
             ),
        ),
      ),
    );
  }
}