import 'dart:ffi';

import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:equatable/equatable.dart';

class TVModel extends Equatable {
  TVModel(
      {required this.adult,
      required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.name,
      required this.originalName,
      required this.overview,
      required this.posterPath,
      required this.runtime,
      required this.voteAverage,
      required this.voteCount});

  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String name;
  final String originalName;
  final String overview;
  final String posterPath;
  final int runtime;
  final double voteAverage;
  final int voteCount;

  factory TVModel.fromJson(Map<String, dynamic> json) => TVModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
      id: json['id'],
      name: json['name'],
      originalName: json['original_name'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      runtime: json['runtime'],
      voteAverage: json['vote_avarage'],
      voteCount: json['vote_count']);

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "name": name,
        "original_name": originalName,
        "overview": overview,
        "poster_path": posterPath,
        'runtime': runtime,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  TV toEntity() {
    return TV(
        adult: this.adult,
        backdropPath: this.backdropPath,
        genreIds: this.genreIds,
        id: this.id,
        overview: this.overview,
        posterPath: this.posterPath,
        runtime: this.runtime,
        name: this.name,
        originalName: this.originalName,
        voteAverage: this.voteAverage,
        voteCount: this.voteCount);
  }

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        name,
        originalName,
        overview,
        posterPath,
        runtime,
        voteAverage,
        voteCount
      ];
}
