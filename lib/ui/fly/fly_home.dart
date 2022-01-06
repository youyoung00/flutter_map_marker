import 'package:flutter/material.dart';
import 'package:flutter_map_marker/constants.dart';
import 'package:flutter_map_marker/ui/shop/shop.dart';

import '../eat/eat.dart';
import 'fly_menu.dart';

class FlyHome extends StatefulWidget {
  const FlyHome({Key? key}) : super(key: key);

  @override
  State<FlyHome> createState() => _FlyHomeState();
}

class _FlyHomeState extends State<FlyHome> {
  final _pageController = PageController();

  List<bool> topBtnState = [
    true,
    false,
    false,
  ];

  List<Widget> pages = [
    const FlyMenu(),
    const Shop(),
    const Eat(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeColor,
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
                        color:
                            topBtnState[0] ? Colors.white : Colors.transparent,
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
                        _pageController.jumpToPage(0);
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
                        color:
                            topBtnState[1] ? Colors.white : Colors.transparent,
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
                      _pageController.jumpToPage(1);
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
                        color:
                            topBtnState[2] ? Colors.white : Colors.transparent,
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
                      _pageController.jumpToPage(2);
                    }
                    setState(() {});
                  },
                ),
              ],
            ),
          )
        ],
      ),
      drawer: const Drawer(),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: pages.length,
        itemBuilder: (BuildContext buildContext, int i) {
          return pages[i];
        },
      ),
    );
  }
}
