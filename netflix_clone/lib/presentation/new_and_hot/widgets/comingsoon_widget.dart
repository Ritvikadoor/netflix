import 'package:flutter/material.dart';

import 'package:netflix_clone/presentation/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constnts.dart';
import '../../home/widgets/custom_button.dart';

class ComingSoonWidget extends StatelessWidget {
  String imageBackPoster;
  String title;
  String subtitle;
  ComingSoonWidget(
      {Key? key,
      required this.title,
      required this.imageBackPoster,
      required this.subtitle})
      : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              VideoWidget(backPoster: imageBackPoster),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -3,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
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
                    ),
                  )
                ],
              ),
              const Text(
                'Coming on Friday',
                style: TextStyle(color: greyColor, fontWeight: FontWeight.bold),
              ),
              kHieght,
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: greyColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
