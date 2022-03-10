import 'package:flutter/material.dart';
import 'package:flutter_map_marker/constants.dart';
import 'package:flutter_map_marker/presentation/screens/fly_calendar_screen.dart';
import 'package:flutter_map_marker/presentation/screens/fly_map_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FlyScreen extends StatefulWidget {
  const FlyScreen({Key? key}) : super(key: key);

  @override
  State<FlyScreen> createState() => _FlyScreenState();
}

class _FlyScreenState extends State<FlyScreen> {
  PanelController panelController = PanelController();

  List<IconData> menuIcons = [
    Icons.person_rounded,
    Icons.room_rounded,
    Icons.flight_rounded,
    Icons.calendar_today_rounded,
  ];

  List<String> menuTitles = [
    '1 Adult, Economy',
    'City, Country',
    'Choose Destination',
    'DepartureDate, ArrivalDate',
  ];

  List<Map<String, String>> cityInfos = [
    {
      'cityName': 'Seoul',
      'cityImg':
          'https://cdn.pixabay.com/photo/2020/11/24/02/13/gyeongbok-palace-5771324__340.jpg',
      'cityInfo': 'Seoul, Korea',
    },
    {
      'cityName': 'Milan',
      'cityImg':
          'https://cdn.pixabay.com/photo/2017/06/24/00/54/milan-cathedral-2436458__340.jpg',
      'cityInfo': 'Milan, Rome',
    },
    {
      'cityName': 'NewYork',
      'cityImg':
          'https://cdn.pixabay.com/photo/2015/05/01/15/13/new-york-748631__340.jpg',
      'cityInfo': 'NewYork, America',
    },
    {
      'cityName': 'Beijing',
      'cityImg':
          'https://cdn.pixabay.com/photo/2015/06/11/08/25/china-805587__340.jpg',
      'cityInfo': 'Beijing, China',
    },
    {
      'cityName': 'ToKyo',
      'cityImg':
          'https://cdn.pixabay.com/photo/2019/04/20/11/39/japan-4141578__340.jpg',
      'cityInfo': 'ToKyo, Japan',
    }
  ];

  @override
  Widget build(BuildContext context) {
    final onPanelSize = MediaQuery.of(context).size.height / 1.8;
    // final viewModel = context.watch<FlyScreenViewModel>();
    const BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return Scaffold(
      body: SlidingUpPanel(
        controller: panelController,
        maxHeight: onPanelSize,
        minHeight: 50,
        borderRadius: radius,
        panel: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Travel Destination',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: cityInfos.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              menuTitles[1] =
                                  cityInfos[i]['cityInfo'].toString();
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FlyMapScreen(
                                  cityName: cityInfos[i]['cityName'].toString(),
                                  cityInfo: cityInfos[i]['cityInfo'].toString(),
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.network(
                                cityInfos[i]['cityImg'].toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(cityInfos[i]['cityName'].toString()),
                            subtitle: Text(cityInfos[i]['cityInfo'].toString()),
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: themeColor,
          child: ListView.builder(
            itemCount: menuIcons.length,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 14,
                ),
                color: secondColor,
                child: GestureDetector(
                  onTap: () {
                    if (menuIcons[i] == Icons.calendar_today_rounded) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FlyCalendarScreen(),
                        ),
                      );
                    } else if (menuIcons[i] == Icons.room_rounded) {
                      panelController.open();
                    }
                  },
                  child: ListTile(
                    leading: Icon(menuIcons[i], color: textColor),
                    title: Text(
                      menuTitles[i],
                      style: const TextStyle(color: textColor),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
