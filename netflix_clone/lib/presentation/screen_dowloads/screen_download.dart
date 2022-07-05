import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constnts.dart';
import 'package:netflix_clone/presentation/widgets/app_bar.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);
  final List imageList = [
    "https://www.themoviedb.org/t/p/w220_and_h330_face/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/xf9wuDcqlUPWABZNeDKPbZUjWx0.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/rJHC1RUORuUhtfNb4Npclx0xnOf.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: const [
              Icon(
                Icons.settings,
                color: kWhiteColor,
              ),
              kWdith,
              Text('Smart Downloads')
            ],
          ),
          const Text('Introducing Downloads for you'),
          const Text(
            'We will download a personalised movies and shows for you, so there is always something to watch on your device ',
          ),
          Container(
            width: size.width,
            height: size.width,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: size.width * 0.37,
                  ),
                ),
                DownloadImageWidget(
                    sized: Size(size.width * 0.38, size.height * 0.28),
                    rotatioAngle: 20,
                    imageList: imageList[0],
                    margin: const EdgeInsets.only(left: 130, bottom: 40)),
                DownloadImageWidget(
                  sized: Size(size.width * 0.38, size.height * 0.28),
                  imageList: imageList[1],
                  rotatioAngle: -20,
                  margin: const EdgeInsets.only(right: 130, bottom: 40),
                ),
                DownloadImageWidget(
                  sized: Size(size.width * 0.40, size.height * 0.33),
                  imageList: imageList[2],
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {},
            child: const Text(
              'Setup',
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MaterialButton(
            color: kWhiteColor,
            onPressed: () {},
            child: const Text(
              'See what you can download',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget(
      {Key? key,
      required this.imageList,
      required this.margin,
      required this.sized,
      this.rotatioAngle = 0})
      : super(key: key);

  final double rotatioAngle;
  final margin;
  final String imageList;
  final Size sized;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotatioAngle * pi / 180,
      child: Container(
        margin: margin,
        width: sized.width,
        height: sized.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
          image: DecorationImage(
              image: NetworkImage(imageList), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
