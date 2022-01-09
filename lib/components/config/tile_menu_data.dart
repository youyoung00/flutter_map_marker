import 'package:flutter/material.dart';
import 'package:flutter_map_marker/model/user_tour_info_model.dart';
import 'package:flutter_map_marker/ui/fly/fly_calendar.dart';

class MenuIconData {
  final IconData menuIconData;
  final String routeName;
  final String info;

  const MenuIconData(
      {required this.routeName,
      required this.menuIconData,
      required this.info});
}

List<MenuIconData> flyMenuDatas = [
  MenuIconData(
    info: UserTourInfoModel.tInfo,
    routeName: '',
    menuIconData: Icons.person_rounded,
  ),
  MenuIconData(
    info: UserTourInfoModel.tCityCountry,
    routeName: '',
    menuIconData: Icons.room_rounded,
  ),
  MenuIconData(
    info: UserTourInfoModel.destination,
    routeName: '',
    menuIconData: Icons.flight_rounded,
  ),
  MenuIconData(
    info: UserTourInfoModel.depArrDate,
    routeName: Calendar.routeName,
    menuIconData: Icons.calendar_today_rounded,
  ),
];
