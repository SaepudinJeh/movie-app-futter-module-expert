import 'package:flutter/material.dart';
import 'package:commons/commons.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/get_popular_tv_series.dart';

class PopularTVNotifier extends ChangeNotifier {
  final GetPopularTVSeries getTVPopular;

  PopularTVNotifier({required this.getTVPopular});

  RequestState _state = RequestState.Empty;

  RequestState get state => _state;

  List<TV> _tvList = [];

  List<TV> get tvList => _tvList;

  String _message = '';

  String get message => _message;

  Future<void> fetchPopularTV() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTVPopular.execute();
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
