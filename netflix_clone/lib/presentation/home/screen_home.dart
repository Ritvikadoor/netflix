import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/constnts.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button.dart';
import 'package:netflix_clone/presentation/home/widgets/numbertitlecard.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

import '../widgets/main_card_widget.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener<UserScrollNotification>(
      onNotification: ((notification) {
        final ScrollDirection direction = notification.direction;
        print(direction);
        if (direction == ScrollDirection.reverse) {
          scrollNotifier.value = false;
        } else if (direction == ScrollDirection.forward) {
          scrollNotifier.value = true;
        }
        return true;
      }),
      child: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 600,
                decoration: const BoxDecoration(
                  color: kWhiteColor,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(kMainIMage),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CustomAddButton(
                        icon: Icons.add,
                        title: "My List",
                      ),
                      _PlayButton(),
                      const CustomAddButton(
                        icon: Icons.info,
                        title: "Info",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          MainCardTitle(
            title: 'Realsed in the past year',
          ),
          kHieght,
          MainCardTitle(
            title: 'Trending Now',
          ),
          kHieght,
          NumberTileCard(),
          kHieght,
          MainCardTitle(
            title: 'Tense Dramas',
          ),
          kHieght,
          MainCardTitle(
            title: 'South Indian Cinema',
          ),
        ],
      ),
    ));
  }

  TextButton _PlayButton() {
    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kWhiteColor)),
        icon: const Icon(
          Icons.play_arrow,
          size: 25,
          color: kBlackColor,
        ),
        label: const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Play",
            style: TextStyle(fontSize: 20, color: kBlackColor),
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
