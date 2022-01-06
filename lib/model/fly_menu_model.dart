import 'package:flutter/material.dart';

class FlyMenuModel {
  String contentsTitle;
  IconData iconData;

  FlyMenuModel({
    required this.contentsTitle,
    required this.iconData,
  });
}

List<FlyMenuModel> flyMenuDatas = [
  FlyMenuModel(
    contentsTitle: '1 Adult, Economy',
    iconData: Icons.person_rounded,
  ),
  FlyMenuModel(
    contentsTitle: 'City, Country',
    iconData: Icons.room_rounded,
  ),
  FlyMenuModel(
    contentsTitle: 'Choose Destination',
    iconData: Icons.flight_rounded,
  ),
  FlyMenuModel(
    contentsTitle: 'Departure - Entrance',
    iconData: Icons.calendar_today_rounded,
  ),
];

// List<Map<String, dynamic>> flyTileDatas = [
//   {
//     'contentsTitle': '1 Adult, Economy',
//     'iconData': Icons.person_rounded,
//   },
//   {
//     'contentsTitle': 'City, Country',
//     'iconData': Icons.room_rounded,
//   },
//   {
//     'contentsTitle': 'Choose Destination',
//     'iconData': Icons.flight_rounded,
//   },
//   {
//     'contentsTitle': 'Departure - Entrance',
//     'iconData': Icons.calendar_today_rounded,
//   },
// ];
