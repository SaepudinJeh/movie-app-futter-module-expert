import 'package:dartz/dartz.dart';
import 'package:commons/commons.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute(String query) {
    return repository.searchMovies(query);
  }
}
