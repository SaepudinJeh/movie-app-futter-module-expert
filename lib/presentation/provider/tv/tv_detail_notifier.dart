import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';
import 'package:ditonton/domain/usecases/movie/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/tv/get_recommendation_tv_series.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_detail_series.dart';
import 'package:ditonton/domain/usecases/tv/get_watchlist_tv_status.dart';
import 'package:ditonton/domain/usecases/tv/remove_watchlist_tv.dart';
import 'package:ditonton/domain/usecases/tv/save_watchlist_tv.dart';
import 'package:flutter/material.dart';

class TVDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetTvDetailSeries getTvDetailSeries;
  final GetRecommendationTVSeries getRecommendationTVSeries;
  final SaveTVWatchlist saveTVWatchlist;
  final RemoveWatchlistTV removeWatchlistTV;
  final GetWatchListTVStatus getWatchListTVStatus;

  TVDetailNotifier(
      {required this.getTvDetailSeries,
      required this.getRecommendationTVSeries,
      required this.getWatchListTVStatus,
      required this.removeWatchlistTV,
      required this.saveTVWatchlist});

  late TvDetail _tvDetail;
  TvDetail get tVDetail => _tvDetail;

  RequestState _tvDetailState = RequestState.Empty;
  RequestState get tVDetailState => _tvDetailState;

  List<TV> _tvRecommendation = [];
  List<TV> get tvRecommendation => _tvRecommendation;

  RequestState _tvRecommendationState = RequestState.Empty;
  RequestState get tvRecommendationState => _tvRecommendationState;

  String _message = '';
  String get message => _message;

  bool _isAddedtoWatchlist = false;
  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  Future<void> fetchTVDetail(int id) async {
    _tvDetailState = RequestState.Loading;
    notifyListeners();
    final detailResult = await getTvDetailSeries.execute(id);
    final tvRecommendation = await getRecommendationTVSeries.execute(id);

    detailResult.fold((failure) {
      _tvDetailState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (dataDetail) {
      _tvRecommendationState = RequestState.Loading;
      _tvDetail = dataDetail;
      notifyListeners();
      tvRecommendation.fold((failure) {
        _tvRecommendationState = RequestState.Error;
        _message = failure.message;
      }, (tvList) {
        _tvRecommendationState = RequestState.Loaded;
        _tvRecommendation = tvList;
      });
      _tvDetailState = RequestState.Loaded;
      notifyListeners();
    });
  }

  String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;

  Future<void> addWatchlist(TvDetail tv) async {
    final result = await saveTVWatchlist.execute(tv);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(tv.id);
  }

  Future<void> removeFromWatchlist(TvDetail tv) async {
    final result = await removeWatchlistTV.execute(tv);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(tv.id);
  }

  Future<void> loadWatchlistStatus(int id) async {
    final result = await getWatchListTVStatus.execute(id);
    _isAddedtoWatchlist = result;
    notifyListeners();
  }
}
