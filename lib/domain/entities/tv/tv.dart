import 'package:equatable/equatable.dart';

class TV extends Equatable {
  TV({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.runtime,
    required this.name,
    required this.originalName,
    required this.voteAverage,
    required this.voteCount,
  });

  TV.whatchlist(
      {required this.id,
      required this.overview,
      required this.posterPath,
      required this.name});

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int id;
  String? name;
  String? overview;
  String? posterPath;
  int? runtime;
  String? originalName;
  double? voteAverage;
  int? voteCount;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        overview,
        posterPath,
        name,
        originalName,
        voteAverage,
        voteCount,
      ];
}
