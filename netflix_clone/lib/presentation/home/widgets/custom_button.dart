import 'package:flutter/material.dart';

import '../../../core/constnts.dart';

class CustomAddButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;

  const CustomAddButton(
      {Key? key,
      required this.icon,
      required this.title,
      this.iconSize = 30,
      this.textSize = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textSize,
          ),
        ),
      ],
    );
  }
}
