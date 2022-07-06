import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/fast_laughs/widget/video_list_item.dart';

import '../../core/colors/colors.dart';

class ScreenFastAndLaugh extends StatelessWidget {
  const ScreenFastAndLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
            child: PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(10, (index) {
                  return VedioListItem(
                    index: index,
                  );
                }))));
  }
}
