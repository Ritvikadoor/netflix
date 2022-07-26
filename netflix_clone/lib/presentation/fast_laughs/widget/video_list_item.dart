import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constnts.dart';
import 'package:netflix_clone/data/data_source/movie_model/movie_model.dart';
import 'package:netflix_clone/data/data_source/movie_remote_data_source.dart';
import 'package:video_player/video_player.dart';

class VedioListItem extends StatefulWidget {
  final dummyVideoUrls = [
    'https://assets.mixkit.co/videos/preview/mixkit-motorcyclist-speeding-through-a-desert-39934-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-family-walking-together-in-nature-39767-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-waves-in-the-water-1164-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-beer-foam-spilling-into-a-glass-on-white-background-5066-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-portrait-of-a-young-boxer-training-on-a-ring-40971-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-tree-branches-in-the-breeze-1188-large.mp4',
  ];

  final int index;
  VedioListItem({Key? key, required this.index}) : super(key: key);

  @override
  State<VedioListItem> createState() => _VedioListItemState();
}

class _VedioListItemState extends State<VedioListItem> {
  // List<MovieModel> listmovie = [];
  // @override
  // void initState() {
  //   listget();

  //   super.initState();
  // }

  // void listget() async {
  //   final movies = await getTrending("popular");
  //   setState(() {
  //     listmovie = movies;
  //     // print(widget.listmovie);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final posterPath =
    //     "https://image.tmdb.org/t/p/w500${listmovie[widget.index].posterPath}";

    final videoUrl =
        widget.dummyVideoUrls[widget.index % widget.dummyVideoUrls.length];
    return Stack(
      children: [
        Container(
          child: FastlaughVideoPlayer(
              videoUrl: videoUrl, onStateChanged: (bool) {}),
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
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aHVtYW58ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                          // "https://image.tmdb.org/t/p/w500${listmovie[widget.index].posterPath}",
                        ),
                        radius: 30,
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

class FastlaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastlaughVideoPlayer(
      {Key? key, required this.videoUrl, required this.onStateChanged})
      : super(key: key);

  @override
  State<FastlaughVideoPlayer> createState() => _FastlaughVideoPlayerState();
}

class _FastlaughVideoPlayerState extends State<FastlaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? VideoPlayer(_videoPlayerController)
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
