import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';
import 'package:ditonton/domain/usecases/tv/get_recommendation_tv_series.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_detail_series.dart';
import 'package:flutter/material.dart';

class TVDetailNotifier extends ChangeNotifier {
  final GetTvDetailSeries getTvDetailSeries;
  final GetRecommendationTVSeries getRecommendationTVSeries;

  TVDetailNotifier(
      {required this.getTvDetailSeries,
      required this.getRecommendationTVSeries});

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
}
