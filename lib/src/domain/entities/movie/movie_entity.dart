import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int userId;
  final int id;
  final String title;

  const MovieEntity({
    required this.userId,
    required this.id,
    required this.title,
  });
  @override
  List<Object?> get props => [userId, id, title];
}
