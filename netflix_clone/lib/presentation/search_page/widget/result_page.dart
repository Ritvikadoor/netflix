import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constnts.dart';
import 'package:netflix_clone/presentation/search_page/widget/title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchTextTitle(
          title: 'Movies and TV',
        ),
        kHieght,
        Expanded(child: GridView.count(shrinkWrap: true, crossAxisCount: 3))
      ],
    );
  }
}
