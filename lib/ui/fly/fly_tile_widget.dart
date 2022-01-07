import 'package:flutter/material.dart';

import '../../constants.dart';

class FlyListTile extends StatefulWidget {
  final IconData iconData;
  final String title;
  final Function? ontap;

  const FlyListTile({
    required this.iconData,
    required this.title,
    this.ontap,
    Key? key,
  }) : super(key: key);

  @override
  State<FlyListTile> createState() => _FlyListTileState();
}

class _FlyListTileState extends State<FlyListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 14,
      ),
      color: secondColor,
      child: ListTile(
        leading: Icon(
          widget.iconData,
          color: Colors.white,
        ),
        title: Text(
          widget.title,
          style: const TextStyle(color: textColor),
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
//         onTap: () => ontap,
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
