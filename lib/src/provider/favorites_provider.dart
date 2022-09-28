import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  final List<int> _favoriteMovies = [];
  List<int> get favoritesMovies => _favoriteMovies;

  final List<String> _posterPath = [];
  List<String> get posterPath => _posterPath;

  final List<String> _type = [];
  List<String> get type => _type;

  void toggleFavoriteMovie(int id, String posterPath, String type) {
    final ifExists = _favoriteMovies.contains(id);
    if (ifExists) {
      _favoriteMovies.remove(id);
      _posterPath.remove(posterPath);
      _type.remove(type);
    } else {
      _favoriteMovies.add(id);
      _posterPath.add(posterPath);
      _type.add(type);
    }
    notifyListeners();
  }

  bool ifExist(int id) {
    final ifExists = _favoriteMovies.contains(id);
    return ifExists;
  }
}
