
// import 'package:dio/dio.dart';
// import 'package:news/model/Movies.dart';

// class MoviesWebService {

//   final Dio dio = Dio();

//   Future<Movies> getMovies() async {
//     try {
//       var response = await dio.get("https://yts.mx/api/v2/list_movies.json");
//       var json = response.data;
//       var responseMovies = Movies.fromJson(json);
//       return responseMovies;
//     } catch (e) {
//       rethrow;
//     }
//   }


// }
import 'package:dio/dio.dart';

import '../model/movies.dart' show Movies;

class MoviesWebService {
  final Dio dio = Dio();

  Future<Movies> getMovies() async {
    try {
      final response = await dio.get("https://yts.mx/api/v2/list_movies.json");
      return Movies.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
