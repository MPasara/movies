import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/popular/domain/blocs/movie_bloc.dart';
import 'package:movies/features/popular/domain/blocs/movie_event.dart';
import 'package:movies/features/popular/domain/blocs/movie_state.dart';
import 'package:movies/features/popular/domain/entities/movie_wrapper.dart';
import 'package:movies/features/popular/presentation/widgets/error_view.dart';
import 'package:movies/features/popular/presentation/widgets/popular_movies_list.dart';
import 'package:movies/generated/l10n.dart';

class PopularMoviesPage extends StatefulWidget {
  const PopularMoviesPage({super.key});

  @override
  State<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  late final ScrollController _scrollController;
  late final TextEditingController _searchController;
  Timer? _debounceTimer;
  bool _isSearching = false;
  String _currentQuery = '';

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _searchController = TextEditingController();
    _scrollController.addListener(_onScroll);

    context.read<MovieBloc>().add(const LoadPopularMovies());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && !_isSearching) {
      context.read<MovieBloc>().add(const LoadMoreMovies());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.8);
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _currentQuery = query.trim();
        _isSearching = _currentQuery.isNotEmpty;
      });

      if (_currentQuery.isEmpty) {
        context.read<MovieBloc>().add(const LoadPopularMovies());
      } else {
        context.read<MovieBloc>().add(SearchMovies(_currentQuery));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _isSearching
                ? S.of(context).search_results_header
                : S.of(context).popular_header,
          ),
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
                  if (_isSearching && _currentQuery.isNotEmpty) {
                    context.read<MovieBloc>().add(SearchMovies(_currentQuery));
                  } else {
                    context.read<MovieBloc>().add(const LoadPopularMovies());
                  }
                },
              ),
              MovieData(:final data) => PopularMoviesList(
                movieWrapper: data,
                scrollController: _scrollController,
                searchController: _searchController,
                onSearchChanged: _onSearchChanged,
                isSearching: _isSearching,
                onRefresh: () {
                  if (_isSearching && _currentQuery.isNotEmpty) {
                    context.read<MovieBloc>().add(
                      SearchMovies(_currentQuery, isRefreshing: true),
                    );
                  } else {
                    context.read<MovieBloc>().add(const RefreshMovies());
                  }
                },
              ),
            };
          },
        ),
      ),
    );
  }
}
