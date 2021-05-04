import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String year;
  final String type;
  final String posterUrl;

  MovieCard(
      {@required this.title,
      @required this.year,
      @required this.type,
      @required this.posterUrl,
      @required Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _radiusTen = BorderRadius.circular(10.0);
    final _textStyle = TextStyle(color: Colors.white);

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
            FittedBox(
              fit: BoxFit.cover,
              child: Image.network(
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
                      child: IconButton(
                        //Icon will change if added to favorites
                        icon: Icon(Icons.favorite_border_sharp),
                        onPressed: () {},
                        color: Theme.of(context).accentColor,
                      ),
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
