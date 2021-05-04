//PACKAGES
import 'package:flutter/material.dart';

//MODELS
import 'package:movie_explorer/Models/movieEntry.dart';

class MovieList with ChangeNotifier {
  //An empty dynamic private list
  List<MovieEntry> _movieList = [];

  List<MovieEntry> get movieList => _movieList;

  insert(List<MovieEntry> entryList) {
    _movieList.addAll(entryList);
    notifyListeners();
  }

  clear() {
    _movieList.clear();
    notifyListeners();
  }
}

class FavoritesList with ChangeNotifier {
  List<MovieEntry> _favoritesList = [];

  List<MovieEntry> get favoritesList => _favoritesList;

  insert(MovieEntry entry) {
    _favoritesList.add(entry);
    notifyListeners();
  }

  remove(MovieEntry entry) {
    _favoritesList.removeWhere((_fav) => _fav.title == entry.title);
    notifyListeners();
  }

  clear() {
    _favoritesList.clear();
    notifyListeners();
  }
}
