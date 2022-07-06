import 'package:flutter/material.dart';

import '../../core/constnts.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: kRadius20,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://www.themoviedb.org/t/p/w220_and_h330_face/ews3l3v7JYLtBS5ansZrXsXLMzl.jpg"))),
    );
  }
}
