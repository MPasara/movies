import 'package:equatable/equatable.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object?> get props => [];
}

final class LoadPopularMovies extends MovieEvent {
  const LoadPopularMovies({this.page = 1, this.isRefreshing = false});

  final int page;
  final bool isRefreshing;

  @override
  List<Object?> get props => [page, isRefreshing];
}

final class LoadMoreMovies extends MovieEvent {
  const LoadMoreMovies();
}

final class RefreshMovies extends MovieEvent {
  const RefreshMovies();
}
