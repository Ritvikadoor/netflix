import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/constnts.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button.dart';
import 'package:netflix_clone/presentation/widgets/app_bar.dart';

import '../../core/colors/colors.dart';

// import '../../core/colors/colors.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              "New & Hot",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                  fontFamily: GoogleFonts.montserrat().fontFamily),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
              ),
              kWdith,
              Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png",
                width: 30,
                height: 30,
              )
            ],
            bottom: TabBar(
              unselectedLabelColor: kWhiteColor,
              isScrollable: true,
              labelColor: kBlackColor,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                color: kWhiteColor,
                borderRadius: kRadius30,
              ),
              tabs: const [
                Tab(
                  text: "Coming Soon 🍿 ",
                ),
                Tab(
                  text: "👀 Everyone's watching",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          _buildCommingSoon(context),
          _buildEveryonesWatching(context),
          // Text('w'),
          // Text('bc'),
        ]),
      ),
    );
  }

  Widget _buildCommingSoon(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView(
      children: [
        Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 500,
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
                  height: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: Image.network(
                              "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/fVpFOcQyHJM2di9upgSIwWD5wac.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: CircleAvatar(
                              backgroundColor: Colors.black.withOpacity(0.7),
                              radius: 20,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.volume_off,
                                  color: kWhiteColor,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                        style: TextStyle(
                            color: greyColor, fontWeight: FontWeight.bold),
                      ),
                      kHieght,
                      const Text(
                        'Train To Busan',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEveryonesWatching(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView(
      children: [
        Row(
          children: [
            SizedBox(
              width: 50,
            ),
            Container(
              width: size.width - 60,
              height: 500,
              color: kWhiteColor,
            ),
          ],
        ),
      ],
    );
  }
}
