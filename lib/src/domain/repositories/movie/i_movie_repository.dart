import '../../entities/movie/movie_entity.dart';
import '../../errors/errors.dart';
import 'package:fpdart/fpdart.dart';

abstract class IMovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getMovies();
}
