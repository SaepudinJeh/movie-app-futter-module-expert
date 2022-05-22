import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/get_on_the_airing_tv_series.dart';
import 'package:tv_series/domain/usecases/get_popular_tv_series.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv_series.dart';

class TVListNotifier extends ChangeNotifier {
  var _onTheAirTV = <TV>[];
  List<TV> get onTheAirTV => _onTheAirTV;

  RequestState _onTheAirTVState = RequestState.Empty;
  RequestState get onTheAirTVState => _onTheAirTVState;

  var _onPopularTV = <TV>[];
  List<TV> get onPopularTV => _onPopularTV;

  RequestState _onPopularTVState = RequestState.Empty;
  RequestState get onPopularTVState => _onPopularTVState;

  var _topRatedTV = <TV>[];
  List<TV> get topRatedTV => _topRatedTV;

  RequestState _topRatedTVState = RequestState.Empty;
  RequestState get topRatedTVState => _topRatedTVState;

  String _message = '';
  String get message => _message;

  TVListNotifier(
      {required this.getOnTheAirTVSeries,
      required this.getPopularTVSeries,
      required this.getTopTVSeries});

  final GetOnTheAirTVSeries getOnTheAirTVSeries;
  final GetPopularTVSeries getPopularTVSeries;
  final GetTopTVSeries getTopTVSeries;

  Future<void> fetchOnTheAirTV() async {
    _onTheAirTVState = RequestState.Loading;
    notifyListeners();

    final result = await getOnTheAirTVSeries.execute();

    result.fold((failure) {
      _onTheAirTVState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (tvData) {
      _onTheAirTVState = RequestState.Loaded;
      _onTheAirTV = tvData;
      notifyListeners();
    });
  }

  Future<void> fetchPopularTV() async {
    _onPopularTVState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTVSeries.execute();

    result.fold((failure) {
      _onPopularTVState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (tvData) {
      _onPopularTVState = RequestState.Loaded;
      _onPopularTV = tvData;
      notifyListeners();
    });
  }

  Future<void> fetchTopRatedTV() async {
    _topRatedTVState = RequestState.Loading;
    notifyListeners();

    final result = await getTopTVSeries.execute();

    result.fold((failure) {
      _topRatedTVState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (tvData) {
      _topRatedTVState = RequestState.Loaded;
      _topRatedTV = tvData;
      notifyListeners();
    });
  }
}
