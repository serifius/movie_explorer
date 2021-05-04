import 'package:flutter/material.dart';

//MODELS
import 'package:movie_explorer/Models/movieEntry.dart';

//WIDGETS
import 'movieCard.dart' show MovieCard;

class MovieGrid extends StatelessWidget {
  final List<MovieEntry> movieList;

  MovieGrid({@required this.movieList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movieList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.685,
      ),
      itemBuilder: (BuildContext context, int i) {
        return new MovieCard(
            title: movieList[i].title,
            year: movieList[i].year,
            type: movieList[i].type,
            posterUrl: movieList[i].posterURL,
            key: Key(movieList[i].imdbID));
      },
    );
  }
}
