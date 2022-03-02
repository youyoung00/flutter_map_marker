import 'package:flutter/material.dart';
import 'package:flutter_map_marker/presentation/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.transparent,
      ),
      home: const Home(),
      // ChangeNotifierProvider<HomeViewModel>(
      //   create: (BuildContext context) =>
      //       HomeViewModel(context.watch<GetSelectedBtn>()),
      //   child: const Home(),
      // ),
    );
  }
}
