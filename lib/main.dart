import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies/common/di/dependency_injection.dart';
import 'package:movies/common/domain/cubits/locale_cubit.dart';
import 'package:movies/common/presentation/cubits/app_info/app_info_cubit.dart';
import 'package:movies/common/utils/custom_observer.dart';
import 'package:movies/features/favourite/data/repositories/database_service.dart';
import 'package:movies/features/favourite/domain/blocs/favourite_movies_bloc.dart';
import 'package:movies/features/popular/domain/blocs/movie_bloc.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';
import 'package:movies/features/popular/presentation/movie_details_page.dart';
import 'package:movies/generated/l10n.dart';
import 'package:movies/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomObserver();
  setupDependencies();
  await getIt<DatabaseService>().initDatabase();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<MovieBloc>()),
        BlocProvider(create: (context) => getIt<FavouriteMoviesBloc>()),
        BlocProvider(create: (context) => getIt<LocaleCubit>()),
        BlocProvider(create: (context) => getIt<AppInfoCubit>()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            locale: context.watch<LocaleCubit>().state,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              ...GlobalMaterialLocalizations.delegates,
            ],
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            ),
            home: const MainPage(),
            routes: {
              MovieDetailsPage.routeName: (context) => MovieDetailsPage(
                movie: ModalRoute.of(context)!.settings.arguments as Movie,
              ),
            },
          );
        },
      ),
    );
  }
}
