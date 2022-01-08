import 'package:flutter/material.dart';
import 'package:flutter_map_marker/ui/fly/fly_calendar.dart';
import 'package:flutter_map_marker/ui/fly/fly_city_google_map.dart';

class MenuIconData {
  final IconData menuIconData;
  final String routeName;
  final String info;

  MenuIconData(
      {required this.routeName,
      required this.menuIconData,
      required this.info});
}

List<MenuIconData> flyMenuDatas = [
  MenuIconData(
    info: '1 Adult, Economy',
    routeName: '',
    menuIconData: Icons.person_rounded,
  ),
  MenuIconData(
    info: 'City, Country',
    routeName: '',
    menuIconData: Icons.room_rounded,
  ),
  MenuIconData(
    info: 'Choose Destination',
    routeName: CityMap.routeName,
    menuIconData: Icons.flight_rounded,
  ),
  MenuIconData(
    info: 'DepartureDate, ArrivalDate',
    routeName: Calendar.routeName,
    menuIconData: Icons.calendar_today_rounded,
  ),
];
