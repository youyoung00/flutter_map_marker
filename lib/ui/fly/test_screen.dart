import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Color(0xFFEAEAEA),
          child: Column(
            children: [
              // HomeHeader(),
              Expanded(
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
