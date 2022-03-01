import 'package:flutter/material.dart';
import 'package:flutter_map_marker/presentation/fly_calendar_screen.dart';

import '../../../model/user_tour_info_model.dart';

class MenuIconData {
  final IconData menuIconData;
  final String routeName;
  String info;

  MenuIconData(
      {required this.routeName,
      required this.menuIconData,
      required this.info});
}

List<MenuIconData> flyMenuDatas = [
  MenuIconData(
    info: tInfo,
    routeName: '',
    menuIconData: Icons.person_rounded,
  ),
  MenuIconData(
    info: tCityCountry,
    routeName: '',
    menuIconData: Icons.room_rounded,
  ),
  MenuIconData(
    info: destination,
    routeName: '',
    menuIconData: Icons.flight_rounded,
  ),
  MenuIconData(
    info: depArrDate,
    routeName: FlyCalendarScreen.routeName,
    menuIconData: Icons.calendar_today_rounded,
  ),
];
