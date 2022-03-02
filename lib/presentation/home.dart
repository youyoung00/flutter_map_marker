import 'package:flutter/material.dart';
import 'package:flutter_map_marker/constants.dart';
import 'package:flutter_map_marker/presentation/eat_screen.dart';
import 'package:flutter_map_marker/presentation/fly_screen.dart';
import 'package:flutter_map_marker/presentation/sleep_screen.dart';

import 'components/appbar_btn_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool btnState = true;
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> appBarBtnDatas = [
    {
      'btnName': 'Fly',
      'page': const FlyScreen(),
      'btnState': true,
    },
    {
      'btnName': 'Sleep',
      'page': const SleepScreen(),
      'btnState': false,
    },
    {
      'btnName': 'Eat',
      'page': const EatScreen(),
      'btnState': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // final viewModel = context.watch<HomeViewModel>();
    // final btnList = viewModel.getSelectedBtn.appBarBtnData.appBarBtnDatas;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeColor,
        leading: const Icon(Icons.menu_rounded),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Image.asset(
              'image/crane.png',
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...appBarBtnDatas
                    .map(
                      (e) => AppBarBtn(
                        onPress: () {
                          setState(
                            () {
                              for (int i = 0; i < appBarBtnDatas.length; i++) {
                                if (i == appBarBtnDatas.indexOf(e)) {
                                  appBarBtnDatas[i]['btnState'] = true;
                                } else {
                                  appBarBtnDatas[i]['btnState'] = false;
                                }
                              }
                              if (e['btnName'] == 'Sleep' ||
                                  e['btnName'] == 'Eat') {
                                const snackBar = SnackBar(
                                  content: Text('서비스 준비 중입니다.'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                          );
                        },
                        btnName: e['btnName'],
                        topBtnState: e['btnState'],
                        currentIndex: appBarBtnDatas.indexOf(e),
                      ),
                    )
                    .toList(),
                // OutlinedButton(
                //   style: ButtonStyle(
                //     shape: MaterialStateProperty.all<OutlinedBorder>(
                //       const StadiumBorder(),
                //     ),
                //     side: MaterialStateProperty.all<BorderSide>(
                //       BorderSide(
                //         width: 2,
                //         color: appBarBtnDatas[0]['btnState']
                //             ? textColor
                //             : Colors.transparent,
                //       ),
                //     ),
                //   ),
                //   child: Text(
                //     appBarBtnDatas[0]['btnName'],
                //     style: const TextStyle(color: textColor),
                //   ),
                //   onPressed: () {
                //     setState(() {
                //       _pageController.jumpToPage(0);
                //       appBarBtnDatas[0]['btnState'] =
                //           !appBarBtnDatas[0]['btnState'];
                //     });
                //   },
                // ),
                // OutlinedButton(
                //   style: ButtonStyle(
                //     shape: MaterialStateProperty.all<OutlinedBorder>(
                //       const StadiumBorder(),
                //     ),
                //     side: MaterialStateProperty.all<BorderSide>(
                //       BorderSide(
                //         width: 2,
                //         color: appBarBtnDatas[1]['btnState']
                //             ? textColor
                //             : Colors.transparent,
                //       ),
                //     ),
                //   ),
                //   child: Text(
                //     appBarBtnDatas[1]['btnName'],
                //     style: const TextStyle(color: textColor),
                //   ),
                //   onPressed: () {
                //     setState(() {
                //       _pageController.jumpToPage(1);
                //       appBarBtnDatas[1]['btnState'] =
                //           !appBarBtnDatas[1]['btnState'];
                //     });
                //   },
                // ),
                // OutlinedButton(
                //   style: ButtonStyle(
                //     shape: MaterialStateProperty.all<OutlinedBorder>(
                //       const StadiumBorder(),
                //     ),
                //     side: MaterialStateProperty.all<BorderSide>(
                //       BorderSide(
                //         width: 2,
                //         color: appBarBtnDatas[2]['btnState']
                //             ? textColor
                //             : Colors.transparent,
                //       ),
                //     ),
                //   ),
                //   child: Text(
                //     appBarBtnDatas[2]['btnName'],
                //     style: const TextStyle(color: textColor),
                //   ),
                //   onPressed: () {
                //     setState(() {
                //       _pageController.jumpToPage(2);
                //       appBarBtnDatas[2]['btnState'] =
                //           !appBarBtnDatas[2]['btnState'];
                //     });
                //   },
                // ),
              ],
              // btnList
              //     .map<Widget>(
              //       (e) => AppBarBtn(
              //         currentIndex: btnList.indexOf(e),
              //         onPress: () {
              //           viewModel.selectedBtn(btnList.indexOf(e));
              //           _pageController.jumpToPage(
              //             btnList.indexOf(e),
              //           );
              //         },
              //         topBtnState: e.btnState,
              //         btnName: e.btnName,
              //       ),
              //     )
              //     .toList(),
            ),
          )
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: appBarBtnDatas.length,
        // btnList.length,
        itemBuilder: (BuildContext context, int index) {
          return appBarBtnDatas[index]['page'];
        },
      ),
    );
  }
}
