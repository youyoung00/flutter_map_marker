import 'package:flutter/material.dart';

class AppBarBtn extends StatefulWidget {
  final List<bool> topBtnState;
  final List<Widget> pages;

  AppBarBtn({
    required this.topBtnState,
    required this.pages,
    Key? key,
  }) : super(key: key);

  @override
  State<AppBarBtn> createState() => _AppBarBtnState();
}

class _AppBarBtnState extends State<AppBarBtn> {
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            width: 2,
            color: topBtnState[0] ? Colors.white : Colors.transparent,
          ),
        ),
      ),
      child: const Text(
        'Fly',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        setState(() {
          topBtnState();
        });
      },
    );
  }

  List topBtnState(List btnStates, int currentIndex) {
    List result = [];

    if (topBtnState[0] == true) {
      return result;
    } else {
      topBtnState[0] = true;
      topBtnState[1] = false;
      topBtnState[2] = false;
      pageController.jumpToPage(0);
    }

    return result;
  }
}
