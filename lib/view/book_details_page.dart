import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
   BookDetailsPage({super.key,required this.id});
int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Books ${id}",style: TextStyle(fontSize: 30),)),
    );
  }
}