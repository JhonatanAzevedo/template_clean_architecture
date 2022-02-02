import 'package:flutter_clean_architecture/src/data/data_sources/movie/movie_data_source.dart';
import 'package:flutter_clean_architecture/src/data/model/movie/movie_model.dart';
import 'package:flutter_clean_architecture/src/data/repositories/movie/movie_repository.dart';
import 'package:flutter_clean_architecture/src/domain/entities/movie/movie_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'movie_repository_test.mocks.dart';

@GenerateMocks([MovieDataSource])
void main() {
  late MockMovieDataSource dataSource;
  late List<Map<String, dynamic>> dataMock;
  late MovieRepository repository;
  late List<MovieEntity> movies;
  setUp(() {
    dataMock = getMock();
    dataSource = MockMovieDataSource();
    repository = MovieRepository(dataSource);
    movies = (dataMock).map((e) => MovieModel.fromMap(e)).toList();
  });
  group('Movie Repository', () {
    test('Deve retornar uma lista', () async {
      //arrange
      when(dataSource.getMovies()).thenAnswer((_) async => dataMock);

      //act
      var result = await repository.getMovies();
      final unfoldedResult = result.getOrElse((_) => movies);

      //assert
      expect(unfoldedResult, movies);
    });
  });
}

List<Map<String, dynamic>> getMock() {
  return [
    {
      "userId": 1,
      "id": 1,
      "title": "quidem molestiae enim",
    },
    {
      "userId": 1,
      "id": 2,
      "title": "sunt qui excepturi placeat culpa",
    },
    {
      "userId": 1,
      "id": 3,
      "title": "omnis laborum odio",
    },
  ];
}
