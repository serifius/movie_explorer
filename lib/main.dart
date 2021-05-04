//PACKAGES
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//SCREENS
import 'Screens/home.dart' show Home;
import 'Screens/favorites.dart' show Favorites;

//STATES
import 'States/states.dart' show MovieList, FavoritesList;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MovieList()),
        ChangeNotifierProvider(create: (context) => FavoritesList()),
      ],
      child: MaterialApp(
        title: 'Movie Explorer',
        initialRoute: "/home",
        routes: {
          "/home": (context) => Home(),
          "/favorites": (context) => Favorites(),
        },
        theme: ThemeData(
          primaryColor: Color(0xFF78cfba),
          primaryColorDark: Color(0xFF459d89),
          primaryColorLight: Color(0xDD78cfba),
          backgroundColor: Colors.grey[300],
          accentColor: Color(0xFF181f33),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Color(0xFF181f33),
            ),
          ),
          fontFamily: "Oswald",
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Theme.of(context).accentColor),
            bodyText2: TextStyle(color: Theme.of(context).accentColor),
            subtitle1: TextStyle(color: Theme.of(context).accentColor),
            subtitle2: TextStyle(color: Theme.of(context).accentColor),
            caption: TextStyle(color: Theme.of(context).accentColor),
          ),
        ),
        home: Home(),
      ),
    );
  }
}
