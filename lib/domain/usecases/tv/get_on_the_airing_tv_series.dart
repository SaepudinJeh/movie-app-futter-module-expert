import 'package:dartz/dartz.dart';
import 'package:commons/commons.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetOnTheAirTVSeries {
  final TVRepository repository;

  GetOnTheAirTVSeries(this.repository);

  Future<Either<Failure, List<TV>>> execute() {
    return repository.getOnTheAirTV();
  }
}
