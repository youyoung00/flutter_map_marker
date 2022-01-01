import 'package:flutter/material.dart';

class Fly extends StatelessWidget {
  const Fly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: const Color.fromRGBO(140, 70, 106, 1),
      ),
    );
  }
}
