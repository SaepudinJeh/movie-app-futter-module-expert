part of 'now_playing_movies_bloc.dart';

@immutable
abstract class NowPlayingMovieEvent extends Equatable {
  const NowPlayingMovieEvent();

  @override
  List<Object?> get props => [];
}

class FetchNowPlayingMovies extends NowPlayingMovieEvent {}
