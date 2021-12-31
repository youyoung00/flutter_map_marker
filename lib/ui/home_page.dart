import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCheck = true;
  List<Map<String, List>> topBtns = {
    'Fly': [true],
    'Shop': [],
    'Eat': [],
  };

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(140, 70, 106, 1),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Image.asset(
              'image/flamingo.png',
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: topBtns.keys
                      .map<Widget>(
                        (value) => OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                StadiumBorder()),
                            side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                  width: 2,
                                  color: topBtns[value] == true
                                      ? Colors.white
                                      : Colors.transparent),
                            ),
                          ),
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            // for(int i = 0; i < topBtns.length; i++){
                            //   if(topBtns.keys.toList().indexOf(value) == 0);
                            // }
                            // topBtns.keys.toList().indexOf(value);

                            // for (int i = 0; i < topBtns.length; i++)
                            //   if (topBtns[i] == true) {
                            //     topBtns[i] = false;
                            //   } else {
                            //     topBtns[i] = true;
                            //   }
                            topBtnCheker();
                            setState(() {});
                          },
                        ),
                      )
                      .toList()
                  // [
                  //   OutlinedButton(
                  //     style: ButtonStyle(
                  //       shape: MaterialStateProperty.all<OutlinedBorder>(
                  //           const StadiumBorder()),
                  //       side: MaterialStateProperty.all<BorderSide>(
                  //         BorderSide(
                  //           width: 2,
                  //           color: isCheck ? Colors.white : Colors.transparent,
                  //         ),
                  //       ),
                  //     ),
                  //     child: const Text(
                  //       'Out',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //     onPressed: () {
                  //       setState(() {
                  //         isCheck = !isCheck;
                  //       });
                  //     },
                  //   ),
                  //   OutlinedButton(
                  //     style: ButtonStyle(
                  //       shape: MaterialStateProperty.all<OutlinedBorder>(
                  //           const StadiumBorder()),
                  //       side: MaterialStateProperty.all<BorderSide>(
                  //           const BorderSide(color: Colors.white, width: 2)),
                  //     ),
                  //     onPressed: () {},
                  //     child: const Text(
                  //       'Shop',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  //   OutlinedButton(
                  //     style: ButtonStyle(
                  //       shape: MaterialStateProperty.all<OutlinedBorder>(
                  //           const StadiumBorder()),
                  //       side: MaterialStateProperty.all<BorderSide>(
                  //           const BorderSide(color: Colors.white, width: 2)),
                  //     ),
                  //     onPressed: () {},
                  //     child: const Text(
                  //       'Eat',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   )
                  // ],
                  ),
            ),
          )
        ],
      ),
      drawer: const Drawer(),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: const Color.fromRGBO(140, 70, 106, 1),
        ),
      ),
    );
  }

  void topBtnCheker() {
    if (topBtns['Fly'] == true) {
      topBtns['Shop'] == false || topBtns['Eat'] == false;
    } else if (topBtns['Shop'] == true) {
      topBtns['Fly'] == false || topBtns['Eat'] == false;
    } else if (topBtns['Eat'] == true) {
      topBtns['Fly'] == false || topBtns['Shop'] == false;
    }

    print(topBtns);
  }
}
