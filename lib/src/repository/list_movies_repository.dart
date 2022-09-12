import 'package:app_desafio_globoplay/src/keys/api_key.dart';
import 'package:app_desafio_globoplay/src/models/list_movies_model.dart';
import 'package:dio/dio.dart';

// criar contador para realizar listagem
int id = 1;

final apikey = ApiKey().apiKey;
String url =
    'https://api.themoviedb.org/4/list/$id?&api_key=$apikey&page=1&language=pt-BR';
final dio = Dio();

class ListMoviesRepository {
  Future<ListMoviesModel> getLista() async {
    final response = await dio.get(url);
    final list = ListMoviesModel.fromJson(response.data);
    return list;
  }
}
