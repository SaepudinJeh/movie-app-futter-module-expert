part of 'search_movies_bloc.dart';

abstract class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();

  @override
  List<Object?> get props => [];
}

class OnQuerySearch extends SearchMoviesEvent {
  final String query;

  const OnQuerySearch(this.query);

  @override
  List<Object?> get props => [query];
}
