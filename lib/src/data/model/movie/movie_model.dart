import '../../../domain/entities/movie/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required int userId,
    required int id,
    required String title,
  }) : super(id: id, userId: userId, title: title);

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
    );
  }
}
