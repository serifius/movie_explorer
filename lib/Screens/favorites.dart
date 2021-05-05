import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//CORE
import 'package:movie_explorer/Core/alertHandler.dart' show alertHandler;

//MODELS
import 'package:movie_explorer/States/states.dart' show FavoritesList;

//WIDGETS
import 'package:movie_explorer/Widgets/movieGrid.dart' show MovieGrid;

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoriler"),
        actions: [
          Consumer<FavoritesList>(builder: (context, state, widget) {
            return TextButton(
              onPressed: () => {
                alertHandler(
                    "Tüm favori listeniz silinecek! Devam etmek istiyor musunuz?",
                    context,
                    state,
                    true)
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.clear_sharp),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    "Temizle",
                  ),
                ],
              ),
            );
          }),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Consumer<FavoritesList>(builder: (context, state, widget) {
          final _favoritesList = state.favoritesList;
          return _favoritesList.length == 0
              ? Container(
                  child: Image.asset("assets/Empty.png"),
                )
              : Container(
                  color: Theme.of(context).backgroundColor,
                  padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                  child: MovieGrid(movieList: _favoritesList),
                );
        }),
      ),
    );
  }
}
