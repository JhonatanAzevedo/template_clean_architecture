import '../../../domain/entities/movie/movie_entity.dart';
import '../../../domain/errors/errors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'movie_state.freezed.dart';

@freezed
class MovieState with _$MovieState {
  const factory MovieState.initial() = _Initial;
  const factory MovieState.loaded(List<MovieEntity> movies) = _Loaded;
  const factory MovieState.error(Failure failure) = _Error;
}
