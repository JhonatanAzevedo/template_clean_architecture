import 'package:dio/dio.dart';
import 'data/data_sources/movie/movie_data_source.dart';
import 'data/repositories/movie/movie_repository.dart';
import 'domain/use_cases/movie/movie_use_case.dart';
import 'presenter/movie/movie_controller.dart';
import 'presenter/movie/movie_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => MovieDataSource(i())),
        Bind((i) => MovieRepository(i())),
        Bind((i) => MovieUseCase(i())),
        Bind((i) => MovieController(i())),
      ];

  @override
  List<ModularRoute> get routes => [ChildRoute('/', child: (_,args)=> const MoviePage())];
}
