import '../../repositories/movie/i_movie_repository.dart';
import '../../entities/movie/movie_entity.dart';
import '../../errors/errors.dart';
import 'package:fpdart/fpdart.dart';

abstract class IMovieUseCase {
  Future<Either<Failure, List<MovieEntity>>> call();
}

class MovieUseCase implements IMovieUseCase {
  final IMovieRepository _repository;

  MovieUseCase(this._repository);
  @override
  Future<Either<Failure, List<MovieEntity>>> call() {
    return _repository.getMovies();
  }
}

