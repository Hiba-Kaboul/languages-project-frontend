import 'package:flutter/material.dart';
import 'package:languages_project/view/cart_page.dart';
import 'package:languages_project/view/favorite_page.dart';
import 'package:languages_project/view/history_page.dart';
import 'package:languages_project/view/home_page.dart';

class BottomNavbarPage extends StatefulWidget {
  const BottomNavbarPage({super.key});

  @override
  State<BottomNavbarPage> createState() => _BottomNavbarPageState();
}

class _BottomNavbarPageState extends State<BottomNavbarPage> {
  int tabsindex = 0;
  List<Widget> pages = [HomePage(), CartPage(), FavoritePage(), HistoryPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      bottomNavigationBar: NavigationBar(
        indicatorColor: Color(0xff90CDF9),////
          selectedIndex: tabsindex,
          onDestinationSelected: (index) {
            setState(() {
              tabsindex = index;
            });
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.local_grocery_store), label: "Cart"),
            NavigationDestination(
                icon: Icon(Icons.favorite), label: "Favorite"),
            NavigationDestination(icon: Icon(Icons.history), label: "History")
          ]),
      body: pages[tabsindex],
    );
  }
}
