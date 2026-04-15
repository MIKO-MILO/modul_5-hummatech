import 'package:flutter/material.dart';
import 'package:modul_5/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath.isNotEmpty) {
      path = imgPath + movie.posterPath;
    } else {
      path = 'https://image.tmdb.org/t/p/w500${movie.posterPath}';
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height / 1.5,
                child: Image.network(path),
              ),
              
              Container(
                child: Text(movie.overview),
                padding: EdgeInsets.only(left: 16, right: 16),
              )
            ],
          ),
        )
      ),
    );
  }
}
