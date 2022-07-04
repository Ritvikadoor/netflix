import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/widgets/app_bar.dart';

import '../../core/colors/colors.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);
  final List imageList = [
    "https://www.themoviedb.org/t/p/w220_and_h330_face/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/xf9wuDcqlUPWABZNeDKPbZUjWx0.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/rJHC1RUORuUhtfNb4Npclx0xnOf.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: AppBarWidget(),
    ));
  }
}
