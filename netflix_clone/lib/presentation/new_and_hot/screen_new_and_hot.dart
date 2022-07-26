import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constnts.dart';
import 'package:netflix_clone/data/data_source/movie_model/movie_model.dart';
import 'package:netflix_clone/data/data_source/movie_remote_data_source.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button.dart';
import 'widgets/comingsoon_widget.dart';

class ScreenNewAndHot extends StatefulWidget {
  ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  List<MovieModel> listmovie = [];
  final _currentIndex = 0;
  @override
  void initState() {
    listget();

    super.initState();
  }

  void listget() async {
    final movies = await getTrending("popular");
    setState(() {
      listmovie = movies;
      // print(listmovie);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: _currentIndex,
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

  Widget _buildCommingSoon(context) {
    return listmovie.isEmpty
        ? Container(child: Center(child: CircularProgressIndicator()))
        : ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, index) => ComingSoonWidget(
                  subtitle: "${listmovie[index].overview}",
                  imageBackPoster:
                      "https://image.tmdb.org/t/p/w500${listmovie[index].backdropPath}",
                  title: "${listmovie[index].title}",
                ));
  }

  Widget _buildEveryonesWatching(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHieght,
          Stack(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${listmovie[index].backdropPath}",
                  fit: BoxFit.contain,
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
          ),
          Text(
            "${listmovie[index].title}",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${listmovie[index].overview}",
            style: TextStyle(color: greyColor),
          ),
          kHieght50,
          kHieght,
        ],
      ),
    );
  }
}
