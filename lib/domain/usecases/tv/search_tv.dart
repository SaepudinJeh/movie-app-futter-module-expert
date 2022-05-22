import 'package:dartz/dartz.dart';
import 'package:commons/commons.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class SearchTV {
  final TVRepository repository;

  SearchTV(this.repository);

  Future<Either<Failure, List<TV>>> execute(String query) {
    return repository.searchTV(query);
  }
}
