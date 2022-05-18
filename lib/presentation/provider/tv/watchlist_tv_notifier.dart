import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_watchlist_tv.dart';
import 'package:flutter/material.dart';

class WatchlistTVNotifier extends ChangeNotifier {
  var _watchlistTV = <TV>[];
  List<TV> get watchlistTV => _watchlistTV;

  var _watchlistState = RequestState.Empty;
  RequestState get watchlistState => _watchlistState;

  String _message = '';
  String get message => _message;

  WatchlistTVNotifier({required this.getTVWatchList});

  final GetTVWatchList getTVWatchList;

  Future<void> fetchWatchlistTV() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getTVWatchList.execute();
    result.fold(
      (failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvData) {
        print('Check dari notifier ${tvData.toString()}');
        _watchlistState = RequestState.Loaded;
        _watchlistTV = tvData;
        notifyListeners();
      },
    );
  }
}
