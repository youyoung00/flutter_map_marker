import 'package:flutter/material.dart';
import 'package:flutter_map_marker/constants.dart';

class AppBarBtn extends StatefulWidget {
  final bool topBtnState;
  final String btnName;
  final int currentIndex;
  final VoidCallback onPress;

  const AppBarBtn({
    required this.btnName,
    required this.topBtnState,
    required this.currentIndex,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  State<AppBarBtn> createState() => _AppBarBtnState();
}

class _AppBarBtnState extends State<AppBarBtn> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
          shape:
              MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
                width: 2,
                color: widget.topBtnState == true
                    ? textColor
                    : Colors.transparent),
          ),
        ),
        child: Text(
          widget.btnName,
          style: const TextStyle(color: textColor),
        ),
        onPressed: widget.onPress);
  }
}
