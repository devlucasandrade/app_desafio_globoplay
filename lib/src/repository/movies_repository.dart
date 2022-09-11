import 'package:app_desafio_globo/src/keys/api_key.dart';
import 'package:app_desafio_globo/src/models/movies_model.dart';
import 'package:dio/dio.dart';

int id = 1;

final apikey = ApiKey().apiKey;
String url = 'https://api.themoviedb.org/4/list/$id?&api_key=$apikey&page=1';

final dio = Dio();

class MoviesRepository {
  Future<MoviesModel> getFilmes() async {
    final response = await dio.get(url);
    final list = MoviesModel.fromJson(response.data);
    return list;
  }
}
