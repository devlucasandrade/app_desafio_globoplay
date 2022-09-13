import 'package:app_desafio_globoplay/src/keys/api_key.dart';
import 'package:app_desafio_globoplay/src/service/api_service.dart';

import '../models/tvshow_model.dart';
import '../models/tvshow_results_model.dart';

int tvId = 94997;
final apikey = ApiKey().apiKey;
final dio = ApiService().dio;

class TVShowRepository {
  Future<TvShowModel> fetchTVShows() async {
    final response =
        await dio.get('/tv/popular?api_key=$apikey&language=pt-BR&page=1');
    final tvshow = TvShowModel.fromJson(response.data);
    return tvshow;
  }

  Future<TvShowResults> fetchTVShowsDetails(int? tvId) async {
    final response = await dio.get('/tv/$tvId?api_key=$apikey&language=pt-BR');
    final tvshowResults = TvShowResults.fromJson(response.data);
    return tvshowResults;
  }
}
