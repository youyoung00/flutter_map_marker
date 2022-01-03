import 'dart:ui';

import 'package:flutter/material.dart';

import 'calendar.dart';

class FlyList extends StatefulWidget {
  const FlyList({Key? key}) : super(key: key);

  @override
  State<FlyList> createState() => _FlyListState();
}

class _FlyListState extends State<FlyList> {
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
          child: ListView.builder(itemBuilder: ),
        );
      },
    );
  }

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
                    child: flyTile[i]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
