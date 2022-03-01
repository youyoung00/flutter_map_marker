import 'package:flutter/material.dart';

class Sleep extends StatelessWidget {
  // static String routeName = '/shop';
  const Sleep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width, color: Colors.green),
    );
  }
}
