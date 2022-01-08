import 'package:flutter/material.dart';
import 'package:flutter_map_marker/ui/fly/fly_calendar.dart';
import 'package:flutter_map_marker/ui/fly/fly_city_google_map.dart';
import 'package:flutter_map_marker/ui/fly/fly_home.dart';

import 'model/fly_city_Info_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FlyHome(),
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          canvasColor: Colors.transparent),
      routes: {Calendar.routeName: (context) => Calendar()},
      onGenerateRoute: (settings) {
        if (settings.name == CityMap.routeName) {
          final args = settings.arguments as FlyCityInfoModel;
          return MaterialPageRoute(
            builder: (context) {
              return CityMap(
                cityName: args.cityName,
                cityInfo: args.cityInfo,
              );
            },
          );
        }
      },
    );
  }
}
