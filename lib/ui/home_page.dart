import 'package:flutter/material.dart';
import 'package:flutter_map_marker/ui/shop.dart';

import 'eat.dart';
import 'fly.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();

  int pageIndex = 0;

  List<bool> topBtnState = [
    true,
    false,
    false,
  ];

  List<Widget> pages = [
    Fly(),
    Shop(),
    Eat(),
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(140, 70, 106, 1),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Image.asset(
                'image/flamingo.png',
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            const StadiumBorder()),
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            width: 2,
                            color: topBtnState[0]
                                ? Colors.white
                                : Colors.transparent,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Fly',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          if (topBtnState[0] == true) {
                            return;
                          } else {
                            topBtnState[0] = true;
                            topBtnState[1] = false;
                            topBtnState[2] = false;
                          }
                        });
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            const StadiumBorder()),
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            width: 2,
                            color: topBtnState[1]
                                ? Colors.white
                                : Colors.transparent,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Shop',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (topBtnState[1] == true) {
                          return;
                        } else {
                          topBtnState[1] = true;
                          topBtnState[0] = false;
                          topBtnState[2] = false;
                        }
                        setState(() {});
                      },
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            const StadiumBorder()),
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            width: 2,
                            color: topBtnState[2]
                                ? Colors.white
                                : Colors.transparent,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Eat',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (topBtnState[2] == true) {
                          return;
                        } else {
                          topBtnState[2] = true;
                          topBtnState[0] = false;
                          topBtnState[1] = false;
                        }
                        setState(() {});
                      },
                    ),
                  ]),
            )
          ]),
      drawer: const Drawer(),
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: pages.length,
          itemBuilder: (BuildContext buildContext, int i) {
            return pages[i];
          },
        ),
      ),
    );
  }
}
