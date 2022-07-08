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
          borderRadius: kRadius10,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://cdn.europosters.eu/image/750/posters/the-dark-tower-city-i49958.jpg"))),
    );
  }
}
