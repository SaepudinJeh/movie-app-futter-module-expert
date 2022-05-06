import 'package:ditonton/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

class TV extends Equatable {
  TV({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.originalName,
    required this.voteAverage,
    required this.voteCount,
  });

  TV.whatchlist(
      {required this.id,
      required this.overview,
      required this.posterPath,
      required this.originalName});

  bool? adult;
  String? backdropPath;
  List<Genre>? genres;
  int id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  int? runtime;
  String? originalName;
  double? voteAverage;
  int? voteCount;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genres,
        id,
        originalTitle,
        overview,
        posterPath,
        releaseDate,
        originalName,
        voteAverage,
        voteCount,
      ];
}
