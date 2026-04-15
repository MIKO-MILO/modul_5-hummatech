import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:modul_5/models/movie.dart';

class HttpService {
  final String apiKey = 'ca9118397804938b7eaef1a9ae9bc4e6';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List<Movie>?> getPopularMovies() async {
    final String url = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(url));
    if (result.statusCode == HttpStatus.ok) {
      print('Sukses');
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List<Movie> movies = (moviesMap as List)
          .map((i) => Movie.fromJson(i))
          .toList();
      return movies;

      // String response = result.body;
      // return response;
    } else {
      print('Gagal');
      print(result.statusCode);
      print(result.body);
      return null;
    }
  }
}
