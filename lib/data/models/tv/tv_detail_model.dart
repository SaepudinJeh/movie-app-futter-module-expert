import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';
import 'package:equatable/equatable.dart';

class TVDetailModel extends Equatable {
  TVDetailModel(
      {required this.backdropPath,
      required this.firstAirDate,
      required this.genres,
      required this.id,
      required this.name,
      required this.originalName,
      required this.posterPath,
      required this.voteAvarage,
      required this.voteCount,
      required this.overview});

  final String? backdropPath;
  final List<GenreModel> genres;
  final int id;
  final String name;
  final String originalName;
  final String? posterPath;
  final String firstAirDate;
  final double voteAvarage;
  final int voteCount;
  final String overview;

  factory TVDetailModel.fromJson(Map<String, dynamic> json) => TVDetailModel(
      backdropPath: json['backdrop_path'],
      firstAirDate: json['first_air_date'],
      genres: List<GenreModel>.from(json['genres'].map((x) => x)),
      id: json['id'],
      name: json['name'],
      originalName: json['original_name'],
      posterPath: json['poster_path'],
      voteAvarage: json['vote_average'],
      voteCount: json['vote_count'],
      overview: json['overview']);

  Map<String, dynamic> toJson() => {
        'backdrop_path': backdropPath,
        'first_air_date': firstAirDate,
        'genres': List<dynamic>.from(genres.map((e) => e.toJson())),
        'id': id,
        'name': name,
        'original_name': originalName,
        'poster_path': posterPath,
        'vote_avarage': voteAvarage,
        'vote_count': voteCount,
        'overview': overview
      };

  TvDetail toEntity() => TvDetail(
      id: this.id,
      genres: genres,
      originalName: this.originalName,
      overview: this.overview,
      posterPath: this.posterPath,
      firstAirDate: this.firstAirDate,
      voteAvarage: this.voteAvarage,
      voteCount: this.voteCount,
      name: this.name);

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        id,
        name,
        originalName,
        posterPath,
        firstAirDate,
        voteAvarage,
        voteCount,
        overview
      ];
}
