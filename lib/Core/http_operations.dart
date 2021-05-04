//PACKAGES
import 'dart:convert';
import 'package:http/http.dart' as http;

//MODELS
import 'package:movie_explorer/Models/movieEntry.dart' show MovieEntry;

//DATA
import 'API_data.dart';

//updateMovieList() fires getMovieList func. and refreshes moviesList for each search request.
//Transfers the string value to getMovieList(). This function is not on the widget tree, so we
//cannot use context. Solution is getting state as parameter.
void updateMovieList(String _searchString, _state) async {
  //Wipes the former search list.
  _state.clear();
  final List<MovieEntry> _tempResult = await getMovieList(_searchString);
  //Inserts new elements to list and notifies listeners.
  await _state.insert(_tempResult);
  print(_tempResult.length);
}

//getMoviesList() makes http GET request with given _searchString value.
//ie. getMoviesList("Godfather");
Future<List<MovieEntry>> getMovieList(String _searchString) async {
  final Uri _uri = Uri.https(API_url, "/", {
    "s": _searchString,
    "apikey": API_key
  }); //example Uri: https://www.omdbapi.com/?s=Godfather&apikey=f5be76ec

  final _response = await http.get(_uri);

  //handle response&errors.
  switch (_response.statusCode) {
    case 200:
      final _tempResult = jsonDecode(_response.body);
      //API response contains an array called "Search".
      Iterable _result = _tempResult["Search"];
      return _result
          .map((movieItem) => MovieEntry.fromJson(movieItem))
          .toList();
      break;
    default:
      throw Exception("Bağlantı sırasında bir hata oluştu!");
      break;
  }
}
