import 'package:flutter/material.dart';
import 'package:flutter_map_marker/controllers/fly_btm_sheet_controller.dart';
import 'package:flutter_map_marker/model/fly_city_model.dart';

import '../../constants.dart';
import 'calendar.dart';
import 'fly_city_google_map.dart';

class FlyMenu extends StatefulWidget {
  const FlyMenu({Key? key}) : super(key: key);

  @override
  State<FlyMenu> createState() => _FlyMenuState();
}

class _FlyMenuState extends State<FlyMenu> {
  final controller = FlyBtmSheetController();

  void _onVerticalGesture(DragUpdateDetails details) {
    // print('제스쳐 시도함=====================${details.primaryDelta}');

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

  String selectedCity = 'Seoul, South Korea';

  @override
  Widget build(BuildContext context) {
    List<Widget> flyTile = [
      const ListTile(
        leading: Icon(
          Icons.person_rounded,
          color: Colors.white,
        ),
        title: Text(
          "1 adult Economy",
          style: TextStyle(color: Colors.white),
        ),
      ),
      ListTile(
        leading: const Icon(
          Icons.room_rounded,
          color: Colors.white,
        ),
        title: Text(
          selectedCity,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: const ListTile(
          leading: Icon(
            Icons.flight_rounded,
            color: Colors.white,
          ),
          title: Text(
            "Choose Destination",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      FlyListTile(
        iconData: Icons.calendar_today_rounded,
        title: "Jun 10 - jun 20",
        ontap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Calendar()),
          );
        },
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: const Color.fromRGBO(140, 70, 106, 1),
            child: Column(
              children: flyTile
                  .map((e) => Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 14,
                        ),
                        color: const Color.fromRGBO(211, 108, 176, 1),
                        child: e,
                      ))
                  .toList(),
            ),
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
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: cityInfos.length,
                                    itemBuilder: (BuildContext context, int i) {
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedCity = cityInfos[i]
                                                    .cityInfo
                                                    .toString();
                                              });
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => CityMap(
                                                    cityInfo: cityInfos[i]
                                                        .cityInfo
                                                        .toString(),
                                                    cityName: cityInfos[i]
                                                        .cityName
                                                        .toString(),
                                                  ),
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

  // SheetState sheetStateBasic(SheetState basic){
  //   if( controller.sheetState == SheetState.basic){
  //       : controller.sheetState == SheetState.full
  //   ? topAppBarBtnHeight
  //       : constraints.maxHeight - headerHeight,
  //   }

  Widget _showBottomSheet() {
    return Expanded(
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cityInfos.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedCity = cityInfos[i].cityInfo.toString();
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CityMap(
                                  cityInfo: cityInfos[i].cityInfo.toString(),
                                  cityName: cityInfos[i].cityName.toString(),
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.network(
                                cityInfos[i].cityImg.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(cityInfos[i].cityName.toString()),
                            subtitle: Text(cityInfos[i].cityInfo.toString()),
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
    );
  }

// 모달 바텀시트로 구현
// void _showModalBottomSheet() {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         height: 500,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(20),
//             topLeft: Radius.circular(20),
//           ),
//         ),
//         child: Column(
//           children: [
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(
//                 'City In Operation',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: cityInfos.length,
//                 itemBuilder: (BuildContext context, int i) {
//                   return Column(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedCity = cityInfos[i].cityInfo.toString();
//                           });
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => MapSample(
//                                 cityName: cityInfos[i].cityName.toString(),
//                                 cityInfo: cityInfos[i].cityInfo.toString(),
//                               ),
//                             ),
//                           );
//                         },
//                         child: ListTile(
//                           leading: SizedBox(
//                             width: 80,
//                             height: 80,
//                             child: Image.network(
//                               cityInfos[i].cityImg.toString(),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           title: Text(
//                             cityInfos[i].cityName.toString(),
//                           ),
//                           subtitle: Text(
//                             cityInfos[i].cityInfo.toString(),
//                           ),
//                         ),
//                       ),
//                       const Divider(),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
}

class FlyListTile extends StatelessWidget {
  final iconData;
  final title;
  final Function ontap;

  const FlyListTile({
    required this.iconData,
    required this.title,
    required this.ontap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 14,
        ),
        color: const Color.fromRGBO(211, 108, 176, 1),
        child: GestureDetector(
          // onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => Calendar()),
          //   );
          // },
          onTap: () => ontap,
          child: ListTile(
            leading: Icon(
              // Icons.calendar_today_rounded,
              iconData,
              color: Colors.white,
            ),
            title: Text(
              // "Jun 10 - jun 20",
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}
