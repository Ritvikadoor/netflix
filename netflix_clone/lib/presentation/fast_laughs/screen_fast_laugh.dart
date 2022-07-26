import 'package:flutter/material.dart';
import 'package:netflix_clone/data/data_source/movie_model/movie_model.dart';
import 'package:netflix_clone/data/data_source/movie_remote_data_source.dart';
import 'package:netflix_clone/presentation/fast_laughs/widget/video_list_item.dart';

import '../../core/colors/colors.dart';

class ScreenFastAndLaugh extends StatefulWidget {
  const ScreenFastAndLaugh({Key? key}) : super(key: key);

  @override
  State<ScreenFastAndLaugh> createState() => _ScreenFastAndLaughState();
}

class _ScreenFastAndLaughState extends State<ScreenFastAndLaugh> {
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
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
            child: PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(10, (index) {
                  return listmovie.isEmpty
                      ? Container(
                          child: Center(child: CircularProgressIndicator()))
                      : VedioListItem(
                          index: index,
                        );
                }))));
  }
}
