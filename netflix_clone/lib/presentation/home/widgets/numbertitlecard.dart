import 'package:flutter/material.dart';

import '../../widgets/main_title.dart';
import 'number_card.dart';

class NumberTileCard extends StatelessWidget {
  const NumberTileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
