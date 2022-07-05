import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constnts.dart';
import 'package:netflix_clone/presentation/search_page/widget/title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Movies and TV',
        ),
        kHieght,
        Expanded(
          child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              childAspectRatio: 1.1 / 1.5,
              children: List.generate(20, (index) {
                return const MainCard();
              })),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);
  final imageUrl =
      "https://www.themoviedb.org/t/p/w220_and_h330_face/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
