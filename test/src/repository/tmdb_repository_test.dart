import 'package:app_desafio_globo/src/repository/tmdb_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = TmdbRepository();

  test('deve trazer instancia do model', () async {
    final list = await repository.getFilmes();
    print(list);
  });

  test('deve trazer id da lista', () async {
    final list = await repository.getFilmes();
    print(list.id);
  });

  test('deve traver o primeiro filme da lista', () async {
    final list = await repository.getFilmes();
    print(list.results![0].originalTitle);
  });

  test('deve trazer o path do cartaz', () async {
    final list = await repository.getFilmes();
    print(list.results![0].posterPath);
  });
}
