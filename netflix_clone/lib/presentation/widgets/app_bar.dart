import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Downloads'),
        Spacer(),
        Icon(
          Icons.cast,
          color: Colors.white,
        ),
        Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        )
      ],
    );
  }
}
