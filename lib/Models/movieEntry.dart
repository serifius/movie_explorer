//MovieEntry Object
class MovieEntry {
  final String title;
  final String year;
  final String imdbID;
  final String type;
  final String posterURL;

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
