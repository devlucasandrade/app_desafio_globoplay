import 'package:app_desafio_globo/src/keys/api_key.dart';
import 'package:dio/dio.dart';

import '../models/movies_model.dart';

// int movieId = 550;
final apikey = ApiKey().apiKey;
// String url = 'https://api.themoviedb.org/3/movie/$movieId?api_key=$apikey';
final dio = Dio();

class MoviesRepository {
  Future<MoviesModel> getFilme(int? movieId) async {
    final response = await dio
        .get('https://api.themoviedb.org/3/movie/$movieId?api_key=$apikey');
    final movie = MoviesModel.fromJson(response.data);
    return movie;
  }
}
