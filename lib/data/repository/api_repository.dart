import 'package:dio/dio.dart';
import 'package:flutter_movies/data/models/movies_response.dart';
import 'package:flutter_movies/data/models/pagintaion_filter.dart';
import 'package:flutter_movies/utils/config.dart';
import 'package:flutter_movies/utils/http_utils.dart';

class ApiRepository {
  Dio _dio = HttpUtils().init();
  Future<MoviesResponse> getMovies(PaginationFilter paginationFilter) async {
    try {
      Response response = await _dio.get(Config.apiUrl, queryParameters: {
        'page': paginationFilter.page,
        'limit': paginationFilter.limit
      });
      MoviesResponse _moviesResponse = MoviesResponse.fromJson(response.data);
      return _moviesResponse;
    } catch (e) {
      throw e;
    }
  }
}
