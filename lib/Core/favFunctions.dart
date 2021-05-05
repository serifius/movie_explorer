import 'package:flutter/material.dart';

//STATES
import 'package:movie_explorer/States/states.dart' show FavoritesList;

//MODELS
import 'package:movie_explorer/Models/movieEntry.dart' show MovieEntry;

dynamic favoritesHandler(
    FavoritesList _favoritesListState, MovieEntry movie, context) {
  List<MovieEntry> _favoritesList = _favoritesListState.favoritesList;
  switch (_favoritesList.contains(movie)) {
    case true:
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                "Bu film favorilerden kaldırılacak! Emin misiniz?",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      _favoritesListState.remove(movie);
                      Navigator.of(context).pop();
                    },
                    child: Text("Eminim"),
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor)),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Geri"))
              ],
            );
          });
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
