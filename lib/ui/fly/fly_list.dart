import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_map_marker/google_map_api.dart';

import 'calendar.dart';

class FlyList extends StatefulWidget {
  const FlyList({Key? key}) : super(key: key);

  @override
  State<FlyList> createState() => _FlyListState();
}

class _FlyListState extends State<FlyList> {
  List<Map<String, String>> btmSheetItems = [
    {
      'CityImg':
          'https://cdn.pixabay.com/photo/2020/11/24/02/13/gyeongbok-palace-5771324__340.jpg',
      'Titles': 'Seoul',
      'SubTitles': 'Seoul, Korea',
    },
    {
      'CityImg':
          'https://cdn.pixabay.com/photo/2017/06/24/00/54/milan-cathedral-2436458__340.jpg',
      'Titles': ' Milan',
      'SubTitles': 'Milan, Rome',
    },
    {
      'CityImg':
          'https://cdn.pixabay.com/photo/2015/05/01/15/13/new-york-748631__340.jpg',
      'Titles': 'NewYork',
      'SubTitles': 'NewYork, America',
    },
    {
      'CityImg':
          'https://cdn.pixabay.com/photo/2015/06/11/08/25/china-805587__340.jpg',
      'Titles': 'Beijing',
      'SubTitles': 'Beijing, China',
    },
    {
      'CityImg':
          'https://cdn.pixabay.com/photo/2019/04/20/11/39/japan-4141578__340.jpg',
      'Titles': 'ToKyo',
      'SubTitles': 'ToKyo, Japan',
    },
  ];

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
                  itemCount: btmSheetItems.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MapSample(
                                  title: btmSheetItems[i]['Titles'].toString(),
                                  subTitle:
                                      btmSheetItems[i]['SubTitles'].toString(),
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.network(
                                btmSheetItems[i]['CityImg'].toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              btmSheetItems[i]['Titles'].toString(),
                            ),
                            subtitle: Text(
                              btmSheetItems[i]['SubTitles'].toString(),
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
