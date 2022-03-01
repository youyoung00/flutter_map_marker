import 'package:flutter/material.dart';
import 'package:flutter_map_marker/presentation/components/datas/tile_menu_data.dart';
import 'package:flutter_map_marker/presentation/components/sliding_panel_widget.dart';
import 'package:flutter_map_marker/presentation/components/tile_menu_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../constants.dart';
import '../model/fly_city_Info_model.dart';
import '../model/user_tour_info_model.dart';

class FlyScreen extends StatefulWidget {
  const FlyScreen({Key? key}) : super(key: key);

  @override
  State<FlyScreen> createState() => _FlyScreenState();
}

class _FlyScreenState extends State<FlyScreen> {
  String selectedCityCountry = tCityCountry;

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = const BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return Scaffold(
      body: SlidingUpPanel(
        maxHeight: 700,
        minHeight: 400,
        borderRadius: radius,
        panel: SlidingPanelWidget(
          cityInfoList: cityInfoList,
          selectedCityCountry: selectedCityCountry,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: themeColor,
          child: Column(
            children: flyMenuDatas
                .map<Widget>(
                  (e) => TileMenu(
                    iconData: e.menuIconData,
                    route: e.routeName,
                    tourInfo: e.menuIconData == Icons.room_rounded
                        ? selectedCityCountry
                        : e.info,
                    voidCallback: () {
                      if (e.routeName == '') {
                        return;
                      } else {
                        Navigator.pushNamed(
                          context,
                          e.routeName,
                          arguments: {'cityName': 'seoul'},
                        );
                      }
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}