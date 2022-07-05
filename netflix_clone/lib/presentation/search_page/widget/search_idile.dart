import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constnts.dart';
import 'package:netflix_clone/presentation/search_page/widget/title.dart';

class ScreenIdile extends StatelessWidget {
  ScreenIdile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextTitle(
            title: 'Top Searches',
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => const TopSearchItemTile(),
              separatorBuilder: (ctx, index) => kHieght20,
              itemCount: 10,
            ),
          ),
        ],
      )),
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({Key? key}) : super(key: key);
  final imageUrl =
      "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/vhHt5mAdNpZNJ0BwWJGMPbme1t1.jpg";

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth * 0.3,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        const Expanded(
            child: Text(
          'Movie Name',
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          radius: 25,
          backgroundColor: kWhiteColor,
          child: CircleAvatar(
            radius: 23,
            backgroundColor: kBlackColor,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kWhiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
