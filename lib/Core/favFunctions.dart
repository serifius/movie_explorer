import 'package:flutter/material.dart';

//STATES
import 'package:movie_explorer/States/states.dart' show FavoritesList;

//MODELS
import 'package:movie_explorer/Models/movieEntry.dart' show MovieEntry;

void favoritesHandler(FavoritesList _favoritesListState, MovieEntry movie) {
  List<MovieEntry> _favoritesList = _favoritesListState.favoritesList;
  switch (_favoritesList.contains(movie)) {
    case true:
      _favoritesListState.remove(movie);
      break;
    case false:
      _favoritesListState.insert(movie);
      break;
    default:
      break;
  }
}

Widget iconSwitcher(FavoritesList _favoritesListState, MovieEntry movie) {
  List<MovieEntry> _favoritesList = _favoritesListState.favoritesList;
  switch (_favoritesList.contains(movie)) {
    case true:
      movie.isFav = true;
      return Icon(Icons.favorite);
    default:
      movie.isFav = false;
      return Icon(Icons.favorite_border_sharp);
  }
}
