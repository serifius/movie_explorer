//PACKAGES
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//CORE
import 'package:movie_explorer/Core/http_operations.dart' show updateMovieList;
import 'package:movie_explorer/Core/alertHandler.dart' show alertHandler;

//MODELS
import 'package:movie_explorer/States/states.dart' show MovieList;

//WIDGETS
import 'package:movie_explorer/Widgets/movieGrid.dart' show MovieGrid;

class Home extends StatelessWidget {
  final String _logoFile =
      "assets/movieLogo.png"; //Provide an asset image file for Home screen logo
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => {Navigator.pushNamed(context, "/favorites")},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.favorite_outline_sharp),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Favoriler",
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 120,
              height: 120,
              child: Image(
                alignment: Alignment.center,
                image: AssetImage(_logoFile),
                filterQuality: FilterQuality.medium,
                width: 120,
                height: 120,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth * 2 / 3,
                  child: TextFormField(
                    controller: searchController,
                    style: TextStyle(color: Theme.of(context).accentColor),
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                        focusColor: Theme.of(context).accentColor,
                        hintText: "Aramak istediğiniz filmin ismini girin"),
                  ),
                ),
                Container(
                  width: screenWidth / 5,
                  child: Consumer<MovieList>(builder: (context, state, widget) {
                    return TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          if (searchController.text.isNotEmpty) {
                            updateMovieList(
                                searchController.text, state, context);
                          } else {
                            alertHandler("Lütfen arama kutusuna metin girin",
                                context, state, false, false, () {});
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search),
                            SizedBox(
                              width: 4.0,
                              height: 34.0,
                            ),
                            Text("Ara"),
                          ],
                        ));
                  }),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Expanded(
              child: Consumer<MovieList>(builder: (context, state, widget) {
                final _movieList = state.movieList;
                return state.movieList.length == 0
                    ? Container(
                        child: Image.asset("assets/Empty.png"),
                      )
                    : Container(
                        color: Theme.of(context).backgroundColor,
                        padding:
                            EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                        child: MovieGrid(movieList: _movieList),
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
