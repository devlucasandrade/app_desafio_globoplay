import 'package:app_movie/src/repository/tvshow_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = TVShowRepository();
  int tvId = 94997;

  test('deve trazer uma instancia de tvshow', () async {
    final tvshow = await repository.fetchTVShows();
    print(tvshow);
  });

  test('deve trazer o nome da primeira serie', () async {
    final tvshowdetails = await repository.fetchTVShowsDetails(tvId);
    print(tvshowdetails.originalName);
  });
}
