import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String description;
  final String posterImagePath;
  final String? backdropImagePath;
  final double voteAverage;
  final List<String> genres;
  final DateTime? releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.posterImagePath,
    this.backdropImagePath,
    required this.voteAverage,
    required this.genres,
    this.releaseDate,
  });

  Movie copyWith({
    int? id,
    String? title,
    String? description,
    String? posterImagePath,
    String? backdropImagePath,
    double? voteAverage,
    List<String>? genres,
    DateTime? releaseDate,
  }) => Movie(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    posterImagePath: posterImagePath ?? this.posterImagePath,
    backdropImagePath: backdropImagePath ?? this.backdropImagePath,
    voteAverage: voteAverage ?? this.voteAverage,
    genres: genres ?? this.genres,
    releaseDate: releaseDate ?? this.releaseDate,
  );

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    posterImagePath,
    backdropImagePath,
    voteAverage,
    genres,
    releaseDate,
  ];
}
