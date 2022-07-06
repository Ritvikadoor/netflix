import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home/widgets/number_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

import '../widgets/main_card_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            MainCardTitle(
              title: 'Realsed in the past year',
            ),
            MainCardTitle(
              title: 'Trending Now',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainTitle(title: "Top 10 TV Shows in India Today"),
                LimitedBox(
                  maxHeight: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                        10,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: NumberCard(
                                index: index,
                              ),
                            )),
                  ),
                )
              ],
            ),
            MainCardTitle(
              title: 'Tense Dramas',
            ),
            MainCardTitle(
              title: 'South Indian Cinema',
            ),
          ],
        ),
      ),
    ));
  }
}

class MainCardTitle extends StatelessWidget {
  const MainCardTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10,
                (index) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: MainCard(),
                    )),
          ),
        )
      ],
    );
  }
}
