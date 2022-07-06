import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constnts.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const MainTitle(title: "Released in the past year"),
        Container(
          width: 140,
          height: 230,
          decoration: BoxDecoration(
              borderRadius: kRadius20,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://www.themoviedb.org/t/p/w220_and_h330_face/ews3l3v7JYLtBS5ansZrXsXLMzl.jpg"))),
        )
      ],
    ));
  }
}
