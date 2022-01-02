import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_marker/ui/eat.dart';
import 'package:flutter_map_marker/ui/fly/fly_list.dart';
import 'package:flutter_map_marker/ui/shop.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  List<bool> topBtnState = [
    true,
    false,
    false,
  ];

  List<Widget> pages = [
    const FlyList(),
    const Shop(),
    const Eat(),
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      // headerExpandedHeight: 0.35,
      alwaysShowLeadingAndAction: true,
      leading: const Icon(
        Icons.menu,
      ),
      title: const Text(""),
      headerWidget: headerWidget(context),
      headerBottomBar: headerBottomBarWidget(),
      body: [
        listView(),
      ],
      fullyStretchable: true,
      expandedBody: bodyView(),
    );
  }

  Container headerBottomBarWidget() {
    return Container(
        // child: Row(
        //   mainAxisSize: MainAxisSize.max,
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Icon(
        //       Icons.settings,
        //       color: Colors.white,
        //     ),
        //   ],
        // ),
        );
  }

  Widget headerWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    'image/flamingo.png',
                    color: Colors.white,
                  ),
                ),
              ),
              OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const StadiumBorder()),
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(
                      width: 2,
                      color: topBtnState[0] ? Colors.white : Colors.transparent,
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
                      color: topBtnState[1] ? Colors.white : Colors.transparent,
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
                      color: topBtnState[2] ? Colors.white : Colors.transparent,
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
        ),
      ],
    );
  }

  ListView listView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white70,
        child: ListTile(
          leading: CircleAvatar(
            child: Text("$index"),
          ),
          title: Text("Title"),
          subtitle: Text("Subtitile"),
        ),
      ),
    );
  }

  Widget bodyView() {
    return PageView.builder(
      controller: _pageController,
      itemCount: pages.length,
      itemBuilder: (BuildContext buildContext, int i) {
        return pages[i];
      },
    );
  }
}
