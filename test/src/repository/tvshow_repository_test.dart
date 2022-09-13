import 'package:app_desafio_globoplay/src/repository/tvshow_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = TVShowRepository();

  test('deve trazer uma instancia de tvshow', () async {
    final tvshow = await repository.fetchTVShows();
    print(tvshow);
  });
}
