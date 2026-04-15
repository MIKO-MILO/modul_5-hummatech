import 'package:flutter/material.dart';
import 'package:modul_5/services/http_service.dart';
import 'package:modul_5/models/movie.dart';
import 'package:modul_5/pages/movie_detail.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({super.key});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  int moviesCount = 0;
  List<Movie> movies = [];
  late HttpService service;

  @override
  void initState() {
    super.initState();
    service = HttpService();
    initialize();
  }

  Future initialize() async {
    var tempMovies = await service.getPopularMovies();

    setState(() {
      movies = tempMovies!;
      moviesCount = movies.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('POPULAR MOVIES')),
      body: ListView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
        itemBuilder: (context, int posisition) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: Image.network(
                'https://image.tmdb.org/t/p/w500${movies[posisition].posterPath}',
                width: 50,
                fit: BoxFit.cover,
              ),
              title: Text(movies[posisition].title),
              subtitle: Text('Rating = ${movies[posisition].voteAverage}'),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => MovieDetail(movies[posisition]),
                );
                Navigator.push(context, route);
              },
            ),
          );
        },
      ),
    );
  }
}
