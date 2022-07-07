import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constnts.dart';
import '../../home/widgets/custom_button.dart';
import '../../widgets/video_widget.dart';

class EveryonsWatchingWidget extends StatelessWidget {
  const EveryonsWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHieght,
        const Text(
          'Friends',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Martial law is declared when a mysterious viral outbreak pushes Korea into a state of emergency. Those on an express train to Busan, a city that has successfully fended off the viral outbreak, must fight for their own survival…',
          style: TextStyle(color: greyColor),
        ),
        kHieght50,
        const VideoWidget(),
        kHieght,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomAddButton(
              icon: Icons.info,
              title: "Share",
              iconSize: 24,
              textSize: 16,
            ),
            kWdith,
            CustomAddButton(
              icon: Icons.add,
              title: "My List",
              iconSize: 24,
              textSize: 16,
            ),
            kWdith,
            CustomAddButton(
              icon: Icons.play_arrow,
              title: "Remind me",
              iconSize: 24,
              textSize: 16,
            ),
            kWdith,
          ],
        )
      ],
    );
  }
}
