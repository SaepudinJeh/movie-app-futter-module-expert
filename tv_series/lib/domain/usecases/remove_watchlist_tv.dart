import 'package:dartz/dartz.dart';
import 'package:commons/commons.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';

class RemoveWatchlistTVSeries {
  final TVRepository repository;

  RemoveWatchlistTVSeries(this.repository);

  Future<Either<Failure, String>> execute(TvDetail tv) {
    return repository.removeWatchlist(tv);
  }
}
