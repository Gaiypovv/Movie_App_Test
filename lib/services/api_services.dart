import 'dart:convert';
import 'dart:developer';

import 'package:movie_app_test/common/utils.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_test/models/movie_detail_model.dart';
import 'package:movie_app_test/models/movie_model.dart';
import 'package:movie_app_test/models/movie_recommendation_model.dart';
import 'package:movie_app_test/models/search_model.dart';
import 'package:movie_app_test/models/tv_series_model.dart';
import 'package:logger/logger.dart';

const baseUrl = 'https://api.themoviedb.org/3/';
var key = '?api_key=$apiKey';
late String endPoint;

final Logger logger = Logger();

class ApiServices {
  Future<MovieModel> getUpcomingMovies() async {
    endPoint = 'movie/upcoming';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load upcoming movies');
  }

  Future<MovieModel> getNowPlayingMovies() async {
    endPoint = 'movie/now_playing';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load now playing movies');
  }

  Future<MovieRecommendationsModel> getPopularMovies() async {
    endPoint = 'movie/popular';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url), headers: {});
    if (response.statusCode == 200) {
      log('success');
      return MovieRecommendationsModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load now playing movies');
  }

  Future<TvSeriesModel> getTopRatedSeries() async {
    endPoint = 'tv/1396/recommendations';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load top rated series');
  }

  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    endPoint = 'movie/$movieId';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return MovieDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie details');
  }

  Future<MovieRecommendationsModel> getMovieRecommendations(int movieId) async {
    endPoint = 'movie/$movieId/recommendations';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return MovieRecommendationsModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie details');
  }

  Future<SearchModel> getSearchedMovie(String searchText) async {
    endPoint = 'search/movie?query=$searchText';
    final url = '$baseUrl$endPoint';
    // ignore: avoid_print
    print(url); // This line will be ignored by the Dart Analyzer
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMzkyZTVhYTAxNTlmOGI3MDBjMjkxMjQzNjJlYTI4MiIsInN1YiI6IjY2MjFiYTg4MzU4ZGE3MDE3ZTQ0M2UzYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HDtSb49qdT6dgxVVSVggkC0hSa7XWJsR2BdzQ1mSEf8'
    });
    logger.d(response.statusCode.toString()); // Logging response status code
    if (response.statusCode == 200) {
      logger.d('success'); // Logging success message
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  search movie ');
  }
}
