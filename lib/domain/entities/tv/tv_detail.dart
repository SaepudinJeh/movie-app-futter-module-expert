import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

class TvDetail extends Equatable {
  final int id;
  final List<GenreModel> genres;
  final String name;
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
      required this.voteCount,
      required this.name});

  @override
  List<Object?> get props => [
        id,
        genres,
        originalName,
        overview,
        posterPath,
        firstAirDate,
        voteAvarage,
        voteCount,
        name
      ];
}
