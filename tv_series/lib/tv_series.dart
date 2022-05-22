library tv_series;

// data => datasource
export 'data/datasources/db/database_helper.dart';
export 'data/datasources/tv_remote_data_source.dart';
export 'data/datasources/tv_local_data_source.dart';

// data => models
export 'data/models/genre_model.dart';
export 'data/models/tv_detail_model.dart';
export 'data/models/tv_model.dart';
export 'data/models/tv_response.dart';
export 'data/models/tv_table.dart';

// data => repository
export 'data/repositories/tv_repository_impl.dart';

// domain => entities
export 'domain/entities/genre_tv.dart';
export 'domain/entities/tv_detail.dart';
export 'domain/entities/tv.dart';

// domain => repositories
export 'domain/repositories/tv_repository.dart';

// domain => usecase
export 'domain/usecases/get_on_the_airing_tv_series.dart';
export 'domain/usecases/get_popular_tv_series.dart';
export 'domain/usecases/get_recommendation_tv_series.dart';
export 'domain/usecases/get_top_rated_tv_series.dart';
export 'domain/usecases/get_tv_detail_series.dart';
export 'domain/usecases/get_watchlist_tv_status.dart';
export 'domain/usecases/get_watchlist_tv.dart';
export 'domain/usecases/remove_watchlist_tv.dart';
export 'domain/usecases/save_watchlist_tv.dart';
export 'domain/usecases/search_tv.dart';

// presentation => provider
export 'presentation/provider/tv_detail_notifier.dart';
export 'presentation/provider/tv_list_notifier.dart';
export 'presentation/provider/tv_popular_notifier.dart';
export 'presentation/provider/tv_search_notifier.dart';
export 'presentation/provider/tv_top_rated_notifier.dart';
export 'presentation/provider/watchlist_tv_notifier.dart';

// presentation => pages
export 'presentation/pages/search_tv_page.dart';
export 'presentation/pages/tv_detail_pages.dart';
export 'presentation/pages/tv_home_page.dart';
export 'presentation/pages/tv_list_pages.dart';
export 'presentation/pages/tv_popular_pages.dart';
export 'presentation/pages/tv_top_rated_pages.dart';
export 'presentation/pages/watchlist_tv_page.dart';

// presentation => widgets
export 'presentation/widgets/tv_card_list.dart';
