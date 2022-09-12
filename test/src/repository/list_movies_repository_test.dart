import 'package:app_desafio_globoplay/src/repository/list_movies_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = ListMoviesRepository();

  test('deve trazer instancia do model', () async {
    final list = await repository.getLista();
    print(list);
  });

  test('deve trazer id da lista', () async {
    final list = await repository.getLista();
    print(list.id);
  });

  test('deve traver o primeiro filme da lista', () async {
    final list = await repository.getLista();
    print(list.results![0].originalTitle);
  });

  test('deve trazer o path do cartaz', () async {
    final list = await repository.getLista();
    print(list.results![0].posterPath);
  });
}
