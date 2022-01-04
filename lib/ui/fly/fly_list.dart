import 'package:flutter/material.dart';
import 'package:flutter_map_marker/model/fly_city_model.dart';
import 'package:flutter_map_marker/ui/fly/fly_city_google_map.dart';

import 'calendar.dart';

class FlyList extends StatefulWidget {
  const FlyList({Key? key}) : super(key: key);

  @override
  State<FlyList> createState() => _FlyListState();
}

class _FlyListState extends State<FlyList> {
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
      const ListTile(
        leading: Icon(
          Icons.room_rounded,
          color: Colors.white,
        ),
        title: Text(
          "Seoul South Korea",
          style: TextStyle(color: Colors.white),
        ),
      ),
      GestureDetector(
        onTap: () {
          _showModalBottomSheet();
        },
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
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Calendar()),
          );
        },
        child: const ListTile(
          leading: Icon(
            Icons.calendar_today_rounded,
            color: Colors.white,
          ),
          title: Text(
            "Jun 10 - jun 20",
            style: TextStyle(color: Colors.white),
          ),
        ),
      )
    ];

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: const Color.fromRGBO(140, 70, 106, 1),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: flyTile.length,
              itemBuilder: (BuildContext context, int i) {
                return Container(
                  height: 50,
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  color: const Color.fromRGBO(211, 108, 176, 1),
                  child: flyTile[i],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 500,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
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
                  itemCount: cityInfos.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MapSample(
                                  cityName: cityInfos[i].cityName.toString(),
                                  cityInfo: cityInfos[i].cityInfo.toString(),
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
                            title: Text(
                              cityInfos[i].cityName.toString(),
                            ),
                            subtitle: Text(
                              cityInfos[i].cityInfo.toString(),
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
