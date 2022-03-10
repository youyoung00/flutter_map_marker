import 'package:flutter/material.dart';

class EatScreen extends StatelessWidget {
  const EatScreen({Key? key}) : super(key: key);

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
