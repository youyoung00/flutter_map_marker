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
          leading: Icon(
            widget.iconData,
            color: Colors.white,
          ),
          title: Text(
            widget.tourInfo,
            style: const TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}

// class FlyListTile extends StatelessWidget {
//   final IconData iconData;
//   final String title;
//   final Function? ontap;
//
//   const FlyListTile({
//     required this.iconData,
//     required this.title,
//     this.ontap,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(
//         vertical: 4,
//         horizontal: 14,
//       ),
//       color: secondColor,
//       child: GestureDetector(
//         onTap: () {
//           Navigator.of(context).pushNamed('/calendar');
//         },
//         child: ListTile(
//           leading: Icon(
//             iconData,
//             color: Colors.white,
//           ),
//           title: Text(
//             title,
//             style: const TextStyle(color: textColor),
//           ),
//         ),
//       ),
//     );
//   }
// }
