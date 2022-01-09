import 'package:flutter/material.dart';
import 'package:flutter_map_marker/components/config/appbar_btn_data.dart';
import 'package:flutter_map_marker/components/widgets/appbar_btn_widget.dart';

import '../../constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pageController = PageController();

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
                children: appBarBtnDatas
                    .map<Widget>((e) => AppBarBtn(
                          currentIndex: appBarBtnDatas.indexOf(e),
                          onPress: () {
                            setState(() {
                              changeBtns(appBarBtnDatas.indexOf(e));
                              _pageController
                                  .jumpToPage(appBarBtnDatas.indexOf(e));
                            });
                          },
                          topBtnState: e.btnState,
                          btnName: e.btnName,
                        ))
                    .toList()),
          )
        ],
      ),
      drawer: const Drawer(),
      body: PageView.builder(
        controller: _pageController,
        itemCount: appBarBtnDatas.length,
        itemBuilder: (BuildContext context, int index) {
          return appBarBtnDatas[index].page;
        },
      ),
    );
  }

  void changeBtns(int btnNum) {
    for (int i = 0; i < appBarBtnDatas.length; i++) {
      if (i == btnNum) {
        appBarBtnDatas[i].btnState = true;
      } else {
        appBarBtnDatas[i].btnState = false;
      }
    }
  }
}
