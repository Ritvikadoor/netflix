import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constnts.dart';
import 'package:netflix_clone/data/data_source/movie_model/movie_model.dart';
import 'package:netflix_clone/data/data_source/movie_remote_data_source.dart';
import 'package:netflix_clone/presentation/search_page/widget/title.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return listmovie.isEmpty
        ? Container(child: Center(child: CircularProgressIndicator()))
        : Column(
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
                      return MainCard(
                        image:
                            "https://image.tmdb.org/t/p/w500${listmovie[index].posterPath}",
                      );
                    })),
              )
            ],
          );
  }
}

class MainCard extends StatelessWidget {
  String image;
  MainCard({Key? key, required this.image}) : super(key: key);
  // final imageUrl =
  //     "https://www.themoviedb.org/t/p/w220_and_h330_face/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
