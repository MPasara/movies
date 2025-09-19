import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/popular/domain/blocs/movie_bloc.dart';
import 'package:movies/features/popular/domain/blocs/movie_event.dart';
import 'package:movies/features/popular/domain/blocs/movie_state.dart';
import 'package:movies/features/popular/domain/entities/movie_wrapper.dart';
import 'package:movies/features/popular/presentation/widgets/error_view.dart';
import 'package:movies/features/popular/presentation/widgets/popular_movies_list.dart';

class PopularMoviesPage extends StatefulWidget {
  const PopularMoviesPage({super.key});

  @override
  State<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    context.read<MovieBloc>().add(const LoadPopularMovies());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<MovieBloc>().add(const LoadMoreMovies());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Popular Movies'),
          centerTitle: false,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: BlocBuilder<MovieBloc, MovieState<MovieWrapper>>(
          builder: (context, state) {
            return switch (state) {
              MovieInitial() => const SizedBox(),
              MovieLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
              MovieError(:final failure) => ErrorView(
                message: failure.message,
                onRetry: () {
                  context.read<MovieBloc>().add(const LoadPopularMovies());
                },
              ),
              MovieData(:final data) => PopularMoviesList(
                movieWrapper: data,
                scrollController: _scrollController,
              ),
            };
          },
        ),
      ),
    );
  }
}
