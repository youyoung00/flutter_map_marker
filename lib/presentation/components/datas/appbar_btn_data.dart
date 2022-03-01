import 'package:flutter/material.dart';

import '../../eat_screen.dart';
import '../../fly_screen.dart';
import '../../sleep_screen.dart';

class AppBarBtnData {
  final String btnName;
  final Widget page;
  bool btnState;

  AppBarBtnData({
    required this.btnName,
    required this.page,
    required this.btnState,
  });

  List<AppBarBtnData> get appBarBtnDatas => _appBarBtnDatas;

  final List<AppBarBtnData> _appBarBtnDatas = [
    AppBarBtnData(
      btnName: 'Fly',
      page: const FlyScreen(),
      btnState: true,
    ),
    AppBarBtnData(
      btnName: 'Sleep',
      page: const SleepScreen(),
      btnState: false,
    ),
    AppBarBtnData(
      btnName: 'Eat',
      page: const EatScreen(),
      btnState: false,
    ),
  ];
}
