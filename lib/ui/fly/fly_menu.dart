import 'package:flutter/material.dart';
import 'package:flutter_map_marker/components/config/tile_menu_data.dart';
import 'package:flutter_map_marker/controllers/fly_btm_sheet_controller.dart';
import 'package:flutter_map_marker/model/fly_city_Info_model.dart';

import '../../components/widgets/tile_menu_widget.dart';
import '../../constants.dart';
import 'fly_city_google_map.dart';

class FlyMenu extends StatefulWidget {
  const FlyMenu({Key? key}) : super(key: key);

  @override
  State<FlyMenu> createState() => _FlyMenuState();
}

class _FlyMenuState extends State<FlyMenu> {
  final controller = FlyBtmSheetController();

  void _onVerticalGesture(DragUpdateDetails details) {
    // Down 제스쳐의 처리
    if (details.primaryDelta! > 5 && details.primaryDelta! < 25) {
      if (controller.sheetState == SheetState.basic) {
        controller.changeSheetState(SheetState.invisible);
      } else if (controller.sheetState == SheetState.full) {
        controller.changeSheetState(SheetState.basic);
      }
    } else if (details.primaryDelta! >= 35) {
      controller.changeSheetState(SheetState.invisible);
    }

    // UP 제스쳐의 처리
    if (details.primaryDelta! < -5 && details.primaryDelta! > -25) {
      if (controller.sheetState == SheetState.invisible) {
        controller.changeSheetState(SheetState.basic);
      } else if (controller.sheetState == SheetState.basic) {
        controller.changeSheetState(SheetState.full);
      }
    } else if (details.primaryDelta! <= -35) {
      controller.changeSheetState(SheetState.full);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: themeColor,
            child: Column(
                children: flyMenuDatas
                    .map<Widget>(
                      (e) => TileMenu(
                        iconData: e.menuIconData,
                        route: e.routeName,
                        tourInfo: e.info,
                      ),
                    )
                    .toList()),
          ),
          AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, _) {
              return LayoutBuilder(
                builder: (context, BoxConstraints constraints) {
                  return Stack(
                    children: [
                      AnimatedPositioned(
                        duration: panelTransition,
                        top: controller.sheetState == SheetState.basic
                            ? topListHeight
                            : controller.sheetState == SheetState.full
                                ? topAppBarBtnHeight
                                : constraints.maxHeight - headerHeight,
                        left: 0,
                        right: 0,
                        height: constraints.maxHeight,
                        child: GestureDetector(
                          onVerticalDragUpdate: _onVerticalGesture,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'City In Operation',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                                const Divider(),
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: cityInfos.length,
                                    itemBuilder: (BuildContext context, int i) {
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              // selectedCity = cityInfos[i]
                                              //     .cityInfo
                                              //     .toString();
                                              // setState(
                                              //   () {},
                                              // );
                                              Navigator.pushNamed(
                                                context,
                                                CityMap.routeName,
                                                arguments: FlyCityInfoModel(
                                                  cityInfo:
                                                      cityInfos[i].cityInfo,
                                                  cityName:
                                                      cityInfos[i].cityName,
                                                  cityImg: cityInfos[i].cityImg,
                                                ),
                                              );
                                            },
                                            child: ListTile(
                                              leading: SizedBox(
                                                width: 80,
                                                height: 80,
                                                child: Image.network(
                                                  cityInfos[i]
                                                      .cityImg
                                                      .toString(),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              title: Text(cityInfos[i]
                                                  .cityName
                                                  .toString()),
                                              subtitle: Text(cityInfos[i]
                                                  .cityInfo
                                                  .toString()),
                                            ),
                                          ),
                                          const Divider()
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
