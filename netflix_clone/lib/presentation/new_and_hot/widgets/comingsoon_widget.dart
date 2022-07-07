import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constnts.dart';
import '../../home/widgets/custom_button.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          height: 450,
          width: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "FEB",
                style: TextStyle(
                  color: greyColor,
                  fontSize: 14,
                ),
              ),
              Text(
                "11",
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 60,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Train To Busan',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -5,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomAddButton(
                          icon: Icons.add_alert_rounded,
                          title: "Remind me",
                          iconSize: 15,
                          textSize: 10,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomAddButton(
                          icon: Icons.info,
                          title: "Info",
                          iconSize: 15,
                          textSize: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Text(
                'Coming on Friday',
                style: TextStyle(color: greyColor, fontWeight: FontWeight.bold),
              ),
              kHieght,
              const Text(
                'Train To Busan',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Martial law is declared when a mysterious viral outbreak pushes Korea into a state of emergency. Those on an express train to Busan, a city that has successfully fended off the viral outbreak, must fight for their own survival…',
                style: TextStyle(color: greyColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
