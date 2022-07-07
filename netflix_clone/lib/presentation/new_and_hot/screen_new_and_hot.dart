import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/constnts.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyons_watiing_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';
import '../../core/colors/colors.dart';
import 'widgets/comingsoon_widget.dart';

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
          _buildCommingSoon(),
          _buildEveryonesWatching(context),
          // Text('w'),
          // Text('bc'),
        ]),
      ),
    );
  }

  Widget _buildCommingSoon() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) => const ComingSoonWidget());
  }

  Widget _buildEveryonesWatching(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) => EveryonsWatchingWidget());
  }
}
