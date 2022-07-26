import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constnts.dart';
import 'package:netflix_clone/data/data_source/movie_model/movie_model.dart';
import 'package:netflix_clone/data/data_source/movie_remote_data_source.dart';
import 'package:netflix_clone/presentation/widgets/app_bar.dart';

class ScreenDownloads extends StatefulWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  @override
  State<ScreenDownloads> createState() => _ScreenDownloadsState();
}

class _ScreenDownloadsState extends State<ScreenDownloads> {
  List<MovieModel> listmovie = [];
  @override
  void initState() {
    listget();

    super.initState();
  }

  void listget() async {
    final movies = await getTrending("popular");
    setState(() {
      listmovie = movies;
      // print(widget.listmovie);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBarWidget(
            title: 'Downloads',
          ),
        ),
        body: listmovie.isEmpty
            ? Container(child: Center(child: CircularProgressIndicator()))
            : ListView(
                children: [
                  _SmartDownloads(),
                  Column(
                    children: [
                      kHieght,
                      kHieght,
                      const Text(
                        'Introducing Downloads for you',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      kHieght,
                      const Text(
                        'We will download a personalised selection of\n movies and shows for you, so there is\nalways something to watch on your\ndevice ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 0.3,
                            wordSpacing: 0.6,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                      listmovie.isEmpty
                          ? Container(
                              child: Center(child: CircularProgressIndicator()))
                          : Container(
                              width: size.width,
                              height: size.width,
                              color: Colors.black,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Center(
                                    child: CircleAvatar(
                                      radius: size.width * 0.3,
                                      backgroundColor:
                                          Colors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                  DownloadImageWidget(
                                      sized: Size(
                                          size.width * 0.25, size.width * 0.4),
                                      rotatioAngle: 15,
                                      imageList:
                                          "https://image.tmdb.org/t/p/w500${listmovie[0].posterPath}",
                                      margin: const EdgeInsets.only(
                                        top: 40,
                                        left: 190,
                                      )),
                                  DownloadImageWidget(
                                    sized: Size(
                                        size.width * 0.25, size.width * 0.4),
                                    imageList:
                                        "https://image.tmdb.org/t/p/w500${listmovie[1].posterPath}",
                                    rotatioAngle: -15,
                                    margin: const EdgeInsets.only(
                                      top: 40,
                                      right: 190,
                                    ),
                                  ),
                                  DownloadImageWidget(
                                    sized: Size(
                                        size.width * 0.35, size.width * 0.48),
                                    imageList:
                                        "https://image.tmdb.org/t/p/w500${listmovie[2].posterPath}",
                                    margin: const EdgeInsets.only(
                                      top: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                  Section3()
                ],
              ));
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonCOlorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Setup',
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        // kHieght,
        MaterialButton(
          color: kWhiteColor,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Text(
              'See What You Can Download',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        // kWdith,
        Text(
          'Smart Downloads',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
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
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: rotatioAngle * pi / 180,
        child: Container(
          // margin: margin,
          width: sized.width,
          height: sized.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
            image: DecorationImage(
                image: NetworkImage(imageList), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
