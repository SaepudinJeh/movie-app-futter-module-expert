import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:movies/movies.dart';
import 'package:mocktail/src/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';

class MockDetailMovieBloc extends MockBloc<DetailMovieEvent, DetailMovieState>
    implements DetailMovieBloc {}

class DetailMovieEventFake extends Fake implements DetailMovieEvent {}

class DetailMovieStateFake extends Fake implements DetailMovieState {}

class MockRecommendMoviesBloc
    extends MockBloc<RecommendMoviesEvent, RecommendMoviesState>
    implements RecommendMoviesBloc {}

class RecommendationMoviesEventFake extends Fake
    implements RecommendMoviesEvent {}

class RecommendationMoviesStateFake extends Fake
    implements RecommendMoviesState {}

class MockWatchlistMoviesBloc
    extends MockBloc<WatchlistMoviesEvent, WatchlistMoviesState>
    implements WatchlistMoviesBloc {}

class WatchlistMoviesEventFake extends Fake implements WatchlistMoviesEvent {}

class WatchlistMoviesStateFake extends Fake implements WatchlistMoviesState {}

@GenerateMocks([DetailMovieBloc])
void main() {
  late MockDetailMovieBloc mockDetailMovieBloc;
  late MockRecommendMoviesBloc mockRecommendationMoviesBloc;
  late MockWatchlistMoviesBloc mockWatchlistMoviesBloc;

  setUpAll(() {
    registerFallbackValue(DetailMovieEventFake());
    registerFallbackValue(DetailMovieStateFake());
    registerFallbackValue(RecommendationMoviesEventFake());
    registerFallbackValue(RecommendationMoviesStateFake());
    registerFallbackValue(WatchlistMoviesEventFake());
    registerFallbackValue(WatchlistMoviesStateFake());
  });

  setUp(() {
    mockDetailMovieBloc = MockDetailMovieBloc();
    mockRecommendationMoviesBloc = MockRecommendMoviesBloc();
    mockWatchlistMoviesBloc = MockWatchlistMoviesBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetailMovieBloc>(create: (context) => mockDetailMovieBloc),
        BlocProvider<RecommendMoviesBloc>(
            create: (context) => mockRecommendationMoviesBloc),
        BlocProvider<WatchlistMoviesBloc>(
            create: (context) => mockWatchlistMoviesBloc),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when Movie not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockDetailMovieBloc.state)
        .thenReturn(const DetailMovieHasData(testMovieDetail));
    when(() => mockRecommendationMoviesBloc.state)
        .thenReturn(RecommendMoviesHasData(testMovieList));
    when(() => mockWatchlistMoviesBloc.state)
        .thenReturn(const WatchlistStatus(false));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when Movie is added to wathclist',
      (WidgetTester tester) async {
    when(() => mockDetailMovieBloc.state)
        .thenReturn(const DetailMovieHasData(testMovieDetail));
    when(() => mockRecommendationMoviesBloc.state)
        .thenReturn(RecommendMoviesHasData(testMovieList));
    when(() => mockWatchlistMoviesBloc.state)
        .thenReturn(const WatchlistStatus(true));

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });
}
