import 'package:dartz/dartz.dart';
import 'package:commons/commons.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';

class GetTopTVSeries {
  final TVRepository repository;

  GetTopTVSeries(this.repository);

  Future<Either<Failure, List<TV>>> execute() {
    return repository.getTopRatedTV();
  }
}
