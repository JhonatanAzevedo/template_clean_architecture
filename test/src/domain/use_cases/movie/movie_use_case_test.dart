import 'package:flutter_clean_architecture/src/domain/entities/movie/movie_entity.dart';
import 'package:flutter_clean_architecture/src/domain/repositories/movie/i_movie_repository.dart';
import 'package:flutter_clean_architecture/src/domain/use_cases/movie/movie_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_use_case_test.mocks.dart';

@GenerateMocks([IMovieRepository])
void main() {
  final _repository = MockIMovieRepository();
  final _useCase = MovieUseCase(_repository);

  group('MovieUseCase', () {
    test('deve retornar uma lista', () async {
      //arrange
      List<MovieEntity> movies = [
        const MovieEntity(id: 1, userId: 2, title: 'alef gay')
      ];
      //act
      when(_repository.getMovies()).thenAnswer((_) async => Right(movies));
      var result = await _useCase();
      //asset
      expect(result, Right(movies));
    });
/* 
    test('deve retornar um error', () async {
      //arrange
      //act
      when(_repository.getMovies()).thenAnswer((_) async => Left(EmptyList()));
      var result = await _useCase();
        final unfoldedResult = result.getOrElse((_) => Left(EmptyList()));
      print(result);
      //asset
      expect(result, Left(EmptyList()));
    }); */
  });
}
