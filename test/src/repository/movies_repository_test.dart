import 'package:app_desafio_globo/src/repository/movies_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = MoviesRepository();

  int movieId = 634649;

  test('deve trazer titulo do filme', () async {
    final movie = await repository.getFilme(movieId);
    print(movie.originalTitle);
  });
}
