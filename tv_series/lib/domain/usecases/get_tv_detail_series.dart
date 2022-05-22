import 'package:dartz/dartz.dart';
import 'package:commons/commons.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';

class GetTvDetailSeries {
  final TVRepository repository;

  GetTvDetailSeries(this.repository);

  Future<Either<Failure, TvDetail>> execute(int id) {
    return repository.getTVDetail(id);
  }
}
