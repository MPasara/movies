// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/popular/data/repositories/movie_repository.dart';
import 'package:movies/features/popular/domain/blocs/movie_event.dart';
import 'package:movies/features/popular/domain/blocs/movie_state.dart';
import 'package:movies/features/popular/domain/entities/movie_wrapper.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState<MovieWrapper>> {
  MovieBloc(this._movieRepository) : super(const MovieInitial()) {
    on<LoadPopularMovies>(_loadPopularMovies);
    on<LoadMoreMovies>(_loadMoreMovies);
    on<RefreshMovies>(_refreshMovies);
    on<SearchMovies>(_searchMovies);
  }

  final MovieRepository _movieRepository;
  MovieWrapper? _movieWrapper;
  AsyncMemoizer? _loadMoreMemoizer;

  Future<void> _loadPopularMovies(
    LoadPopularMovies event,
    Emitter<MovieState<MovieWrapper>> emit,
  ) async {
    if (event.isRefreshing || event.page == 1) {
      emit(const MovieLoading());
      _movieWrapper = null;
      _loadMoreMemoizer = null;
    }

    final result = await _movieRepository.fetchPopularMovies(event.page);

    result.fold((failure) => emit(MovieError(failure)), (nextWrapper) {
      if (event.page == 1 || event.isRefreshing) {
        _movieWrapper = nextWrapper;
      } else {
        _movieWrapper = MovieWrapper(
          currentPage: nextWrapper.currentPage,
          totalPages: nextWrapper.totalPages,
          movies: [..._movieWrapper!.movies, ...nextWrapper.movies],
          isLoading: false,
        );
      }
      emit(MovieData(_movieWrapper!));
    });
  }

  Future<void> _loadMoreMovies(
    LoadMoreMovies event,
    Emitter<MovieState<MovieWrapper>> emit,
  ) async {
    if (_movieWrapper != null &&
        _movieWrapper!.currentPage < _movieWrapper!.totalPages &&
        !_movieWrapper!.isLoading) {
      _loadMoreMemoizer ??= AsyncMemoizer();

      await _loadMoreMemoizer!.runOnce(() async {
        final nextPage = _movieWrapper!.currentPage + 1;

        final loadingWrapper = MovieWrapper(
          currentPage: _movieWrapper!.currentPage,
          totalPages: _movieWrapper!.totalPages,
          movies: _movieWrapper!.movies,
          isLoading: true,
        );
        emit(MovieData(loadingWrapper));

        final result = await _movieRepository.fetchPopularMovies(nextPage);

        result.fold(
          (failure) {
            final errorWrapper = MovieWrapper(
              currentPage: _movieWrapper!.currentPage,
              totalPages: _movieWrapper!.totalPages,
              movies: _movieWrapper!.movies,
              isLoading: false,
            );
            _movieWrapper = errorWrapper;
            emit(MovieData(errorWrapper));
          },
          (movieWrapper) {
            final updatedMovieWrapper = MovieWrapper(
              totalPages: movieWrapper.totalPages,
              currentPage: movieWrapper.currentPage,
              movies: [..._movieWrapper!.movies, ...movieWrapper.movies],
              isLoading: false,
            );

            _movieWrapper = updatedMovieWrapper;
            emit(MovieData(updatedMovieWrapper));
          },
        );

        _loadMoreMemoizer = null;
      });
    }
  }

  Future<void> _refreshMovies(
    RefreshMovies event,
    Emitter<MovieState<MovieWrapper>> emit,
  ) async {
    add(const LoadPopularMovies(page: 1, isRefreshing: true));
  }

  Future<void> _searchMovies(
    SearchMovies event,
    Emitter<MovieState<MovieWrapper>> emit,
  ) async {
    if (event.query.trim().isEmpty) {
      add(const LoadPopularMovies(page: 1));
      return;
    }

    if (event.isRefreshing) {
      emit(const MovieLoading());
    }

    _movieWrapper = null;
    _loadMoreMemoizer = null;

    final result = await _movieRepository.searchForMovies(event.query);

    result.fold((failure) => emit(MovieError(failure)), (movieWrapper) {
      _movieWrapper = movieWrapper;
      emit(MovieData(movieWrapper));
    });
  }
}
