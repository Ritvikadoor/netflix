import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constnts.dart';

class VideoWidget extends StatelessWidget {
  String backPoster;
  VideoWidget({Key? key, required this.backPoster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Image.network(
            backPoster,
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
    );
  }
}
