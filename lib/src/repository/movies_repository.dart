import 'package:app_desafio_globoplay/src/keys/api_key.dart';
import 'package:app_desafio_globoplay/src/service/api_service.dart';

import '../models/movies/movies_details_model.dart';
import '../models/movies/movies_model.dart';

int movieId = 550;
final apikey = ApiKey().apiKey;
final dio = ApiService().dio;

class MoviesRepository {
  Future<MoviesModel> fetchMovies() async {
    final response =
        await dio.get('/movie/popular?api_key=$apikey&language=pt-BR&page=1');
    final movies = MoviesModel.fromJson(response.data);
    return movies;
  }

  Future<DetailsMoviesModel> fetchDetails(int? movieId) async {
    final response =
        await dio.get('/movie/$movieId?api_key=$apikey&language=pt-BR');
    final movieDetails = DetailsMoviesModel.fromJson(response.data);
    return movieDetails;
  }
}
