//MovieEntry Object
class MovieEntry {
  final String title;
  final String year;
  final String
      imdbID; //imdbID variable is not needed currently. This will be used as item key and it is here for just in case needed in the future updates.
  final String type;
  final String posterURL;
  bool isFav = false;

  MovieEntry({this.title, this.year, this.imdbID, this.type, this.posterURL});

  factory MovieEntry.fromJson(Map<String, dynamic> movieItem) {
    return MovieEntry(
      title: movieItem["Title"],
      year: movieItem["Year"],
      imdbID: movieItem["imdbID"],
      type: movieItem["Type"],
      posterURL: movieItem["Poster"],
    );
  }
}
