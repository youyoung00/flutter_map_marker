import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';

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
            Container(
              height: 250,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: flyTile.length,
                itemBuilder: (BuildContext context, int i) {
                  return Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      color: const Color.fromRGBO(211, 108, 176, 1),
                      child: flyTile[i]);
                },
              ),
            ),
            DraggableHome(
              title: Text("Ttitle"),
              headerWidget: headerWidget(context),
              body: [
                // shrinkWrap true required for ListView.builder()
                // disable the scroll for any verically scrollable widget
                // provide top padding 0 to fix extra space in listView
                Container(
                  height: 200,
                  color: Colors.blue,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container headerBottomBarWidget() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Container headerWidget(BuildContext context) => Container(
        height: 100,
        child: Center(
          child: Text("Title",
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white70)),
        ),
      );

  ListView listView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      // physics: NeverScrollableScrollPhysics(),
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white70,
        child: ListTile(
          leading: CircleAvatar(
            child: Text("$index"),
          ),
          title: Text("Title"),
          subtitle: Text("Subtitile"),
        ),
      ),
    );
  }
}
