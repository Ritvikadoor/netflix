import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/constnts.dart';
import 'package:netflix_clone/data/data_source/movie_model/movie_model.dart';
import 'package:netflix_clone/data/data_source/movie_remote_data_source.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button.dart';
import 'package:netflix_clone/presentation/home/widgets/numbertitlecard.dart';
import 'package:netflix_clone/presentation/main_page/widgets/bottomnav.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  List<MovieModel> listmovie = [];

  ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    listget();

    super.initState();
  }

  void listget() async {
    final movies = await getTrending("popular");
    setState(() {
      widget.listmovie = movies;
      print(widget.listmovie);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, value, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: ((notification) {
            final ScrollDirection direction = notification.direction;
            // print(direction);
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          }),
          child: Stack(
            children: [
              ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 600,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500${widget.listmovie[0].posterPath}"),
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
                  FirstCard(
                    title: 'Realsed in the past year',
                  ),
                  kHieght,
                  SecondCard(title: 'Trending Now'),
                  kHieght,
                  const NumberTileCard(),
                  kHieght,
                  // MainCardTitle(
                  //   title: 'Tense Dramas',
                  // ),
                  kHieght,
                  // MainCardTitle(
                  //   title: 'South Indian Cinema',
                  // ),
                ],
              ),
              scrollNotifier.value == true
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: double.infinity,
                        height: 90,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  "https://www.nicepng.com/png/full/12-127235_netflix-logo-png.png",
                                  width: 40,
                                  height: 40,
                                ),
                                const Spacer(),
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
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'TV Shows ',
                                  style: TextStyle(
                                      // color: kBlackColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Movies',
                                  style: TextStyle(
                                      // color: kBlackColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Categories',
                                  style: TextStyle(
                                      // color: kBlackColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : kHieght,
            ],
          ),
        );
      },
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
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Play",
            style: TextStyle(fontSize: 20, color: kBlackColor),
          ),
        ));
  }
}

class FirstCard extends StatefulWidget {
  FirstCard({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FirstCard> createState() => _FirstCardState();
}

class _FirstCardState extends State<FirstCard> {
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
      print(listmovie);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: widget.title),
        LimitedBox(
          maxHeight: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return Container(
                width: 140,
                height: 230,
                decoration: BoxDecoration(
                    borderRadius: kRadius10,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://image.tmdb.org/t/p/w500${listmovie[index].posterPath}"))),
              );
            },
            itemCount: listmovie.length,
          ),
        )
      ],
    );
  }
}

class SecondCard extends StatefulWidget {
  SecondCard({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SecondCard> createState() => _SecondCardState();
}

class _SecondCardState extends State<SecondCard> {
  List<MovieModel> listmovie = [];

  @override
  void initState() {
    listget();
    super.initState();
  }

  void listget() async {
    final movies = await getTrending("upcoming");
    setState(() {
      listmovie = movies;
      print(listmovie);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: widget.title),
        LimitedBox(
          maxHeight: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return Container(
                width: 140,
                height: 230,
                decoration: BoxDecoration(
                    borderRadius: kRadius10,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://image.tmdb.org/t/p/w500${listmovie[index].posterPath}"))),
              );
            },
            itemCount: listmovie.length,
          ),
        )
      ],
    );
  }
}

// class CardReleased extends StatefulWidget {
//   final int index;

//   const CardReleased({Key? key, required this.index}) : super(key: key);

//   @override
//   State<CardReleased> createState() => _CardReleasedState();
// }

// class _CardReleasedState extends State<CardReleased> {
//   List<MovieModel> listmovie = [];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 140,
//       height: 230,
//       decoration: BoxDecoration(
//           borderRadius: kRadius10,
//           image: DecorationImage(
//               fit: BoxFit.cover,
//               image: NetworkImage(
//                   "https://image.tmdb.org/t/p/w500${listmovie[widget.index].posterPath}"))),
//     );
//   }
// }

// class MainCard extends StatefulWidget {
//   final int index;
//   List<MovieModel> listmovie = [];

//   MainCard({Key? key, required this.index}) : super(key: key);

//   @override
//   State<MainCard> createState() => _MainCardState();
// }

// class _MainCardState extends State<MainCard> {
//   @override
//   void initState() {
//     listget();

//     super.initState();
//   }

//   void listget() async {
//     final movies = await getTrending("popular");
//     setState(() {
//       widget.listmovie = movies;
//       print(widget.listmovie);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 140,
//       height: 230,
//       decoration: BoxDecoration(
//           borderRadius: kRadius10,
//           image: DecorationImage(
//               fit: BoxFit.cover,
//               image: NetworkImage(
//                   "https://image.tmdb.org/t/p/w500${widget.listmovie[widget.index].posterPath}"))),
//     );
//   }
// }
