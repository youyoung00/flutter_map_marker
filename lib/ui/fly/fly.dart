import 'package:flutter/material.dart';
import 'package:flutter_map_marker/components/config/tile_menu_data.dart';
import 'package:flutter_map_marker/model/fly_city_Info_model.dart';
import 'package:flutter_map_marker/model/user_tour_info_model.dart';
import 'package:flutter_map_marker/ui/widgets/sliding_panel_item.dart';
import 'package:flutter_map_marker/ui/widgets/tile_menu_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../constants.dart';

class Fly extends StatefulWidget {
  const Fly({Key? key}) : super(key: key);

  @override
  State<Fly> createState() => _FlyState();
}

class _FlyState extends State<Fly> {
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
        minHeight: 40,
        borderRadius: radius,
        panel: SlidingPanelItem(
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
                          Navigator.pushNamed(context, e.routeName,
                              arguments: {'cityName': 'seoul'});
                        }
                      },
                    ),
                  )
                  .toList()),
        ),
      ),
    );
  }
}
