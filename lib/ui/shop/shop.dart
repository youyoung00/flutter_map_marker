import 'package:flutter/material.dart';

class Shop extends StatelessWidget {
  // static String routeName = '/shop';
  const Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width, color: Colors.green),
    );
  }
}
