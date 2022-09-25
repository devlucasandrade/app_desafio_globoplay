import 'package:app_desafio_globoplay/src/keys/api_key.dart';
import 'package:app_desafio_globoplay/src/service/api_service.dart';

import '../models/tvshow/tvshow_details_model.dart';
import '../models/tvshow/tvshow_model.dart';

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

  Future<TvShowDetailsModel> fetchTVShowsDetails(int? tvId) async {
    final response = await dio.get('/tv/$tvId?api_key=$apikey&language=pt-BR');
    final tvshowResults = TvShowDetailsModel.fromJson(response.data);
    return tvshowResults;
  }

  Future<TvShowModel> fetchTrending() async {
    final response =
        await dio.get('/trending/tv/day?api_key=$apikey&language=pt-BR');
    final tvshow = TvShowModel.fromJson(response.data);
    return tvshow;
  }
}
