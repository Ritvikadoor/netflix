import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constnts.dart';

class VedioListItem extends StatelessWidget {
  final int index;
  const VedioListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /////left side
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.7),
                  radius: 25,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.volume_off,
                      color: kWhiteColor,
                      size: 22,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          "https://www.themoviedb.org/t/p/w220_and_h330_face/rJHC1RUORuUhtfNb4Npclx0xnOf.jpg",
                        ),
                      ),
                    ),
                    VideoActionWidget(
                      icon: Icons.emoji_emotions,
                      title: 'LOL',
                    ),
                    VideoActionWidget(icon: Icons.add, title: 'My List'),
                    VideoActionWidget(icon: Icons.share, title: 'Share'),
                    VideoActionWidget(icon: Icons.play_arrow, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        ),
        ////right side
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const VideoActionWidget({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            title,
            style: TextStyle(color: kWhiteColor, fontSize: 15),
          )
        ],
      ),
    );
  }
}
