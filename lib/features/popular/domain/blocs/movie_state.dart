import 'package:equatable/equatable.dart';
import 'package:movies/common/domain/failure.dart';

sealed class MovieState<State> extends Equatable {
  const MovieState();

  const factory MovieState.initial() = MovieInitial;
  const factory MovieState.loading() = MovieLoading;
  const factory MovieState.error(Failure failure) = MovieError;
  const factory MovieState.data(State data) = MovieData;

  @override
  List<Object?> get props => [];
}

final class MovieInitial<State> extends MovieState<State> {
  const MovieInitial();
}

final class MovieLoading<State> extends MovieState<State> {
  const MovieLoading();
}

final class MovieError<State> extends MovieState<State> {
  final Failure failure;

  const MovieError(this.failure);

  @override
  List<Object?> get props => [failure];
}

final class MovieData<State> extends MovieState<State> {
  final State data;

  const MovieData(this.data);

  @override
  List<Object?> get props => [data];
}
