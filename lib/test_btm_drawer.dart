import 'package:flutter/material.dart';

class BtmSheet extends StatefulWidget {
  const BtmSheet({Key? key}) : super(key: key);

  @override
  State<BtmSheet> createState() => _BtmSheetState();
}

class _BtmSheetState extends State<BtmSheet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int value = 1;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: InkWell(
              onTap: () {
                setState(() {
                  value++;
                });
              },
              child: Container(
                  width: size.width * 0.8,
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.teal),
                  child: Center(
                    child: Text(
                      'Show Bottom Sheet',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  )),
            ),
          ),
          AnimatedContainer(
            transform: Matrix4.translationValues(
                0,
                value == 0
                    ? size.height
                    : value == 1
                        ? size.height * 0.8
                        : value == 2
                            ? size.height * 0.6
                            : value == 3
                                ? size.height * 0.4
                                : value == 4
                                    ? size.height * 0.2
                                    : value == 5
                                        ? 0
                                        : size.height,
                0),
            duration: Duration(milliseconds: 500),
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18), color: Colors.teal),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (value > 5) {
                          value = 0;
                        }
                        value++;
                      });
                    },
                    child: Icon(
                      Icons.arrow_upward_rounded,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      setState(() {
                        value--;
                      });
                    },
                    child: Icon(
                      Icons.arrow_downward_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
