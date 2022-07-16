import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:netflix_clone/data/data_source/movie_model/movie_model.dart';

Future<List<MovieModel>> getTrending(String kCatagory) async {
  final response = await http.get(
    Uri.parse(
      'https://api.themoviedb.org/3/movie/$kCatagory?api_key=9aa37aa0d7dc43deb70be932ae813a13',
    ),
  );
  if (response.statusCode == 200) {
    final responseBody = json.decode(response.body);

    Iterable list = responseBody['results'];

    return list.map((model) => MovieModel.fromJson(model)).toList();
  } else {
    print('hello');
    throw Exception(response.reasonPhrase);
  }
}
