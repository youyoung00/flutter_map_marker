import 'package:flutter/material.dart';
import 'package:flutter_map_marker/presentation/components/appbar_btn_widget.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'home_view_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final btnList = viewModel.getSelectedBtn.appBarBtnData.appBarBtnDatas;
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
              children: btnList
                  .map<Widget>(
                    (e) => AppBarBtn(
                      currentIndex: btnList.indexOf(e),
                      onPress: () {
                        setState(
                          () {
                            viewModel.selectedBtn(btnList.indexOf(e));
                            _pageController.jumpToPage(
                              btnList.indexOf(e),
                            );
                          },
                        );
                      },
                      topBtnState: e.btnState,
                      btnName: e.btnName,
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
      drawer: const Drawer(),
      body: PageView.builder(
        controller: _pageController,
        itemCount: btnList.length,
        itemBuilder: (BuildContext context, int index) {
          return btnList[index].page;
        },
      ),
    );
  }
}
