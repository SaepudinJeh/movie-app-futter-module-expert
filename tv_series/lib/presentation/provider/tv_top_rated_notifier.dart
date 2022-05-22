import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv_series.dart';

class TopRatedTVNotifier extends ChangeNotifier {
  final GetTopTVSeries getTopTVSeries;

  TopRatedTVNotifier({required this.getTopTVSeries});

  RequestState _state = RequestState.Empty;

  RequestState get state => _state;

  List<TV> _tvList = [];

  List<TV> get tvList => _tvList;

  String _message = '';

  String get message => _message;

  Future<void> fetchTopRatedTV() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTopTVSeries.execute();
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tvsData) {
        _tvList = tvsData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}