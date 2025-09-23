import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_response.g.dart';

@JsonSerializable()
class GenreResponse extends Equatable {
  final int id;
  final String name;

  const GenreResponse({required this.id, required this.name});

  factory GenreResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);

  @override
  List<Object?> get props => [id, name];
}

@JsonSerializable()
class GenreResponseWrapper extends Equatable {
  final List<GenreResponse> genres;

  const GenreResponseWrapper({required this.genres});

  factory GenreResponseWrapper.fromJson(Map<String, dynamic> json) =>
      _$GenreResponseWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$GenreResponseWrapperToJson(this);

  @override
  List<Object?> get props => [genres];
}
