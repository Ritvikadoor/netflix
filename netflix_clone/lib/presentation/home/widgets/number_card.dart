import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constnts.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              width: 140,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: kRadius20,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://www.themoviedb.org/t/p/w220_and_h330_face/ews3l3v7JYLtBS5ansZrXsXLMzl.jpg"),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: 10,
          child: BorderedText(
            strokeWidth: 10.0,
            strokeColor: kWhiteColor,
            child: Text(
              "${index + 1}",
              style: TextStyle(
                fontSize: 120,
                color: kBlackColor,
                decoration: TextDecoration.none,
                decorationColor: kWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
