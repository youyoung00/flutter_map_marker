import 'package:flutter/material.dart';

class SleepScreen extends StatelessWidget {
  // static String routeName = '/sleep';
  const SleepScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.green,
      ),
    );
  }
}
