import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/domain/errors/errors.dart';

abstract class IMovieDataSource {
  Future<List<dynamic>> getMovies();
}

class MovieDataSource implements IMovieDataSource {
  final Dio _dio;

  MovieDataSource(this._dio);
  @override
  Future<List> getMovies() async {
    var result = await _dio.get('https://jsonplaceholder.typicode.com/albums/');
    if (result.statusCode == 200) {
      return result.data;
    } else {
      throw EmptyList();
    }
  }
}
