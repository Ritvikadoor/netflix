import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constnts.dart';
import 'package:netflix_clone/data/data_source/movie_model/movie_model.dart';
import 'package:netflix_clone/data/data_source/movie_remote_data_source.dart';

import '../../widgets/main_title.dart';

class NumberTileCard extends StatefulWidget {
  const NumberTileCard({
    Key? key,
  }) : super(key: key);

  @override
  State<NumberTileCard> createState() => _NumberTileCardState();
}

class _NumberTileCardState extends State<NumberTileCard> {
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
      //print(listmovie);
    });
  }

  @override
  Widget build(BuildContext context) {
    return listmovie.isEmpty
        ? Container(child: Center(child: CircularProgressIndicator()))
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainTitle(title: "Top 10 TV Shows in India Today"),
              LimitedBox(
                maxHeight: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      10,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      height: 150,
                                    ),
                                    Container(
                                      width: 140,
                                      height: 230,
                                      decoration: BoxDecoration(
                                        borderRadius: kRadius10,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "https://image.tmdb.org/t/p/w500${listmovie[index].posterPath}"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  left: 10,
                                  bottom: -25,
                                  child: BorderedText(
                                    strokeWidth: 10.0,
                                    strokeColor: kWhiteColor,
                                    child: Text(
                                      "${index + 1}",
                                      style: TextStyle(
                                        fontSize: 120,
                                        fontWeight: FontWeight.bold,
                                        color: kBlackColor,
                                        decoration: TextDecoration.none,
                                        decorationColor: kWhiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                ),
              )
            ],
          );
  }
}
