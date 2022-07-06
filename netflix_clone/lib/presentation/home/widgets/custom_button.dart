import 'package:flutter/material.dart';

import '../../../core/constnts.dart';

class CustomAddButton extends StatelessWidget {
  final IconData icon;
  final String title;

  const CustomAddButton({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
