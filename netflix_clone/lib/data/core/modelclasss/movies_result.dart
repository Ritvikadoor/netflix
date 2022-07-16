// import 'package:netflix_clone/data/model_model_class.dart';

// class api {
//   List<MovieModel>? movies;

//   api({
//     required this.movies,
//   });

//   api.fromJson(Map<String, dynamic> json) {
//     if (json['results'] != null) {
//       movies = <MovieModel>[];
//       json['results'].foreach((v) {
//         movies!.add(MovieModel.fromJson(v));
//       });
//     }
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.movies != null) {
//       data['results'] = this.movies!.map((v) => v.toJson()).toList();
//     }
//     print(data);
//     return data;
//   }
// }
