import 'package:flutter/material.dart';

class Eat extends StatelessWidget {
  // static String routeName = '/eat';
  const Eat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
      ),
    );
  }
}
