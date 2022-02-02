import 'package:flutter_clean_architecture/src/data/data_sources/movie/movie_data_source.dart';
import 'package:flutter_clean_architecture/src/data/model/movie/movie_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/entities/movie/movie_entity.dart';
import '../../../domain/repositories/movie/i_movie_repository.dart';

class MovieRepository implements IMovieRepository {
  final MovieDataSource _dataSource;

  MovieRepository(this._dataSource);
  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies() async {
    try {
      var result = await _dataSource.getMovies();
      List<MovieEntity> movies =
          (result).map((e) => MovieModel.fromMap(e)).toList();
      return Right(movies);
    } catch (e) {
      return Left(EmptyList());
    }
  }
}
