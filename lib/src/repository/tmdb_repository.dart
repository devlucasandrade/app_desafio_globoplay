import 'package:app_desafio_globo/src/keys/api_key.dart';
import 'package:app_desafio_globo/src/models/tmdb_model.dart';
import 'package:dio/dio.dart';

// criar contador para realizar listagem
int id = 1;

final apikey = ApiKey().apiKey;
String url = 'https://api.themoviedb.org/4/list/$id?&api_key=$apikey&page=1';
final dio = Dio();

class TmdbRepository {
  Future<TmdbModel> getFilmes() async {
    final response = await dio.get(url);
    final list = TmdbModel.fromJson(response.data);
    return list;
  }
}
