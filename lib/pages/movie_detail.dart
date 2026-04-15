import 'package:flutter/material.dart';
import 'package:modul_5/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500';

  const MovieDetail(this.movie, {super.key});

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
                // padding: EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height / 1.4,
                child: Image.network(path),
              ),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  movie.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: const Color.fromARGB(255, 253, 233, 60),
                      size: 24,
                    ),
                    SizedBox(width: 4),
                    Text(
                      movie.voteAverage.toStringAsFixed(1),
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 16,
                ),
                child: Text(movie.overview, style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
