import 'package:flutter/material.dart';

class MoviesProvider with ChangeNotifier {
  final List<int> _favoriteMovies = [];
  List<int> get favoritesMovies => _favoriteMovies;

  final List<String> _posterPath = [];
  List<String> get posterPath => _posterPath;

  void toggleFavoriteMovie(int id, String posterPath) {
    final ifExists = _favoriteMovies.contains(id);
    if (ifExists) {
      _favoriteMovies.remove(id);
      _posterPath.remove(posterPath);
    } else {
      _favoriteMovies.add(id);
      _posterPath.add(posterPath);
    }
    notifyListeners();
  }

  bool ifExist(int id) {
    final ifExists = _favoriteMovies.contains(id);
    return ifExists;
  }
}
