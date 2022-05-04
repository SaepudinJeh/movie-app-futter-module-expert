import 'package:ditonton/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

class TvDetail extends Equatable {
  final int id;
  final List<Genre> genres;
  final String originalName;
  final String overview;
  final String? posterPath;
  final String firstAirDate;
  final double voteAvarage;
  final int voteCount;

  TvDetail(
      {required this.id,
      required this.genres,
      required this.originalName,
      required this.overview,
      required this.posterPath,
      required this.firstAirDate,
      required this.voteAvarage,
      required this.voteCount});

  @override
  List<Object?> get props => [
        id,
        genres,
        originalName,
        overview,
        posterPath,
        firstAirDate,
        voteAvarage,
        voteCount
      ];
}
