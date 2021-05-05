//PACKAGES
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//STATES
import 'package:movie_explorer/States/states.dart' show FavoritesList;

//MODELS
import 'package:movie_explorer/Models/movieEntry.dart' show MovieEntry;

//CORE
import 'package:movie_explorer/Core/favFunctions.dart'
    show favoritesHandler, iconSwitcher;

class MovieCard extends StatelessWidget {
  final MovieEntry movie;

  MovieCard({@required this.movie, @required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _radiusTen = BorderRadius.circular(10.0);
    final _textStyle = TextStyle(color: Colors.white);
    final String title = movie.title;
    final String year = movie.year;
    final String type = movie.type;
    final String posterUrl = movie.posterURL;

    return Card(
      elevation: 3.0,
      color: Theme.of(context).primaryColor,
      shadowColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: _radiusTen,
      ),
      child: ClipRRect(
        borderRadius: _radiusTen,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.network(
              posterUrl,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loading) {
                if (loading == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loading.expectedTotalBytes != null
                        ? loading.cumulativeBytesLoaded /
                            loading.expectedTotalBytes
                        : null,
                  ),
                );
              },
              cacheHeight: 300,
              filterQuality: FilterQuality.medium,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Theme.of(context).primaryColor,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 115,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              title,
                              style: _textStyle,
                            ),
                          ),
                          Text(
                            "Yıl: " + year,
                            style: _textStyle,
                          ),
                          Text(
                            type == "movie" ? "Film" : "Dizi",
                            style: _textStyle,
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Consumer<FavoritesList>(
                          builder: (context, state, widget) {
                        final _favoritesListState = state;
                        return IconButton(
                          //Icon will change if added to favorites
                          icon: iconSwitcher(_favoritesListState, movie),
                          onPressed: () =>
                              favoritesHandler(_favoritesListState, movie),
                          color: Theme.of(context).accentColor,
                        );
                      }),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
