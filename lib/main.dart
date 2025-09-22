import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies/common/di/dependency_injection.dart';
import 'package:movies/features/favourite/data/repositories/database_service.dart';
import 'package:movies/features/favourite/domain/blocs/favourite_movies_bloc.dart';
import 'package:movies/features/popular/domain/blocs/movie_bloc.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';
import 'package:movies/features/popular/presentation/movie_details_page.dart';
import 'package:movies/generated/l10n.dart';
import 'package:movies/main_page.dart';
import 'package:movies/movie_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MovieObserver();
  setupDependencies();
  await getIt<DatabaseService>().initDatabase();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<MovieBloc>()),
        BlocProvider(create: (context) => getIt<FavouriteMoviesBloc>()),
      ],
      child: MaterialApp(
        locale: Locale('en'),
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MainPage(),
        routes: {
          MovieDetailsPage.routeName: (context) => MovieDetailsPage(
            movie: ModalRoute.of(context)!.settings.arguments as Movie,
          ),
        },
      ),
    );
  }
}
