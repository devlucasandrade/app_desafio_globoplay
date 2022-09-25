import 'package:app_desafio_globoplay/src/keys/api_key.dart';
import 'package:app_desafio_globoplay/src/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/movies/details_model.dart';
import '../models/movies/movies_model.dart';

final apikey = ApiKey().apiKey;
final dio = ApiService().dio;

class MoviesRepository with ChangeNotifier {
  Future<MoviesModel> fetchMovies() async {
    try {
      final response =
          await dio.get('/movie/popular?api_key=$apikey&language=pt-BR&page=1');
      return MoviesModel.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint('Status code: ${e.response?.statusCode.toString()}');
      throw Exception('Falha ao buscar os filmes');
    }
  }

  Future<DetailsMoviesModel> fetchDetails(int? movieId) async {
    try {
      final response =
          await dio.get('/movie/$movieId?api_key=$apikey&language=pt-BR');
      return DetailsMoviesModel.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint('Status code: ${e.response?.statusCode.toString()}');
      throw Exception('Falha ao buscar detalhes dos filmes');
    }
  }

  Future<MoviesModel> fetchTrending() async {
    try {
      final response =
          await dio.get('/trending/movie/day?api_key=$apikey&language=pt-BR');
      return MoviesModel.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint('Status code: ${e.response?.statusCode.toString()}');
      throw Exception('Falha ao buscar detalhes');
    }
  }
}
