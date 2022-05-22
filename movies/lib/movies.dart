library movies;

// data => datasources
export 'data/datasources/db/database_helper.dart';
export 'data/datasources/movie_local_data_source.dart';
export 'data/datasources/movie_remote_data_source.dart';

// data => models
export 'data/models/genre_model.dart';
export 'data/models/movie_detail_model.dart';
export 'data/models/movie_model.dart';
export 'data/models/movie_response.dart';
export 'data/models/movie_table.dart';

// data => repository
export 'data/repositories/movie_repository_impl.dart';

// domain => entities
export 'domain/entities/genre.dart';
export 'domain/entities/movie.dart';
export 'domain/entities/movie_detail.dart';

// domain => repository
export 'domain/repositories/movie_repository.dart';

// domain => usecases
export 'domain/usecases/get_movie_detail.dart';
export 'domain/usecases/get_movie_recommendations.dart';
export 'domain/usecases/get_now_playing_movies.dart';
export 'domain/usecases/get_popular_movies.dart';
export 'domain/usecases/get_top_rated_movies.dart';
export 'domain/usecases/get_watchlist_movies.dart';
export 'domain/usecases/get_watchlist_status.dart';
export 'domain/usecases/remove_watchlist.dart';
export 'domain/usecases/save_watchlist.dart';
export 'domain/usecases/search_movies.dart';

// presentation => pages
export 'presentation/pages/about_page.dart';
export 'presentation/pages/home_page.dart';
export 'presentation/pages/movie_detail_page.dart';
export 'presentation/pages/movie_list.dart';
export 'presentation/pages/popular_movies_page.dart';
export 'presentation/pages/search_page.dart';
export 'presentation/pages/top_rated_movies_page.dart';
export 'presentation/pages/watchlist_movies_page.dart';

// presentation => provider
export 'presentation/provider/movie_detail_notifier.dart';
export 'presentation/provider/movie_list_notifier.dart';
export 'presentation/provider/movie_search_notifier.dart';
export 'presentation/provider/popular_movies_notifier.dart';
export 'presentation/provider/top_rated_movies_notifier.dart';
export 'presentation/provider/watchlist_movie_notifier.dart';

// presentation => widgets
export 'presentation/widgets/custom_drawer.dart';
export 'presentation/widgets/movie_card_list.dart';
