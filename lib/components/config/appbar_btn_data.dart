import 'package:flutter/material.dart';
import 'package:flutter_map_marker/ui/eat/eat.dart';
import 'package:flutter_map_marker/ui/fly/fly.dart';
import 'package:flutter_map_marker/ui/shop/sleep.dart';

class AppBarBtnData {
  final String btnName;
  final Widget page;
  bool btnState;

  AppBarBtnData({
    required this.btnName,
    required this.page,
    required this.btnState,
  });
}

List<AppBarBtnData> appBarBtnDatas = [
  AppBarBtnData(
    btnName: 'Fly',
    page: const Fly(),
    btnState: true,
  ),
  AppBarBtnData(
    btnName: 'Sleep',
    page: const Sleep(),
    btnState: false,
  ),
  AppBarBtnData(
    btnName: 'Eat',
    page: const Eat(),
    btnState: false,
  ),
];
