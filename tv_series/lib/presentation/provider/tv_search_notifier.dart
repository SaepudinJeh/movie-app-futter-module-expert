import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/search_tv.dart';

class SearchTVNotifier extends ChangeNotifier {
  final SearchTV searchTV;

  SearchTVNotifier({required this.searchTV});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TV> _searchResult = [];
  List<TV> get searchResult => _searchResult;

  String _message = '';
  String get message => _message;

  Future<void> fetchTVSearch(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await searchTV.execute(query);
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (data) {
        _searchResult = data;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}