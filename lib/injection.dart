import 'package:commons/commons.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:movies/movies.dart';

import 'package:tv_series/tv_series.dart';

import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // provider
  // Movie
  locator.registerFactory(
    () => MovieListNotifier(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailNotifier(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieSearchNotifier(
      searchMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesNotifier(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieNotifier(
      getWatchlistMovies: locator(),
    ),
  );
  // TV
  locator.registerFactory(() => TVListNotifier(
      getOnTheAirTVSeries: locator(),
      getPopularTVSeries: locator(),
      getTopTVSeries: locator()));
  locator.registerLazySingleton(() => TVDetailNotifier(
      getTvDetailSeries: locator(),
      getRecommendationTVSeries: locator(),
      getWatchListTVStatus: locator(),
      saveTVWatchlist: locator(),
      removeWatchlistTV: locator()));
  locator.registerFactory(() => PopularTVNotifier(getTVPopular: locator()));
  locator.registerFactory(() => TopRatedTVNotifier(getTopTVSeries: locator()));
  locator.registerFactory(() => SearchTVNotifier(searchTV: locator()));
  locator.registerFactory(() => WatchlistTVNotifier(getTVWatchList: locator()));

  // use case movie
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  // use case TV
  locator.registerLazySingleton(() => GetOnTheAirTVSeries(locator()));
  locator.registerLazySingleton(() => GetPopularTVSeries(locator()));
  locator.registerLazySingleton(() => GetTvDetailSeries(locator()));
  locator.registerLazySingleton(() => GetRecommendationTVSeries(locator()));
  locator.registerLazySingleton(() => GetTopTVSeries(locator()));
  locator.registerLazySingleton(() => GetTVWatchList(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTV(locator()));
  locator.registerLazySingleton(() => SaveTVWatchlist(locator()));
  locator.registerLazySingleton(() => SearchTV(locator()));
  locator.registerLazySingleton(() => GetWatchListTVStatus(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
        remoteDataSource: locator(),
        localDataSource: locator(),
        networkInfo: locator()),
  );
  locator.registerLazySingleton<TVRepository>(() => TVRepositoryImpl(
      remoteDataSource: locator(), localDataSource: locator()));

  // network info
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<TVRemoteDataSource>(
      () => TVRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TVLocalDataSource>(
      () => TVLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator
      .registerLazySingleton<DatabaseMovieHelper>(() => DatabaseMovieHelper());
  locator.registerLazySingleton<DatabaseTVHelper>(() => DatabaseTVHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => DataConnectionChecker());
}
