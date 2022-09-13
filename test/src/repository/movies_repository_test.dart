import 'package:app_desafio_globoplay/src/repository/movies_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = MoviesRepository();

  test('deve trazer instancia do model', () async {
    final list = await repository.fetchMovies();
    print(list);
  });

  test('deve traver o primeiro filme da lista', () async {
    final list = await repository.fetchMovies();
    print(list.results![0].title);
  });

  test('deve trazer o path do cartaz', () async {
    final list = await repository.fetchMovies();
    print(list.results![0].posterPath);
  });

  test('deve trazer titulo do filme', () async {
    final movie = await repository.fetchDetails(movieId);
    print(movie.originalTitle);
  });
}
