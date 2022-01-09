import 'package:flutter/material.dart';

import '../../constants.dart';

class TileMenu extends StatefulWidget {
  final IconData iconData;
  final String tourInfo;
  final String route;

  const TileMenu({
    required this.iconData,
    required this.tourInfo,
    required this.route,
    Key? key,
  }) : super(key: key);

  @override
  State<TileMenu> createState() => _TileMenuState();
}

class _TileMenuState extends State<TileMenu> {
  @override
  void initState() {
    print(widget.tourInfo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 14,
      ),
      color: secondColor,
      child: GestureDetector(
        onTap: () {
          if (widget.route == '') {
            return;
          } else {
            Navigator.pushNamed(context, widget.route);
          }
        },
        child: ListTile(
          leading: Icon(widget.iconData, color: textColor),
          title: Text(
            widget.tourInfo,
            style: const TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
