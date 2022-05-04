import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetSimilarTVSeries {
  final TVRepository repository;

  GetSimilarTVSeries(this.repository);

  Future<Either<Failure, List<TV>>> execute(id) {
    return repository.getSimilarTVSeries(id);
  }
}
