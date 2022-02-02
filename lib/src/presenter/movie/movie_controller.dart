import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/src/domain/use_cases/movie/movie_use_case.dart';
import 'package:flutter_clean_architecture/src/presenter/movie/state/movie_state.dart';

class MovieController extends ValueNotifier<MovieState> {
  final MovieUseCase _useCase;
  String title = 'nome';
  String a = 'jhonatan';
  String b = 'alef';
  String c = 'jardiano';
  String d = 'moises';

   changeTitle(String newValue) {
    title = newValue;
    notifyListeners();
  }

  MovieController(this._useCase) : super(const MovieState.initial());

  Future<void> showMovie() async {
    var result = await _useCase();
    value =
        result.fold((l) => MovieState.error(l), (r) => MovieState.loaded(r));
  }
}
