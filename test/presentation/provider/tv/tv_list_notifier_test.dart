import 'package:dartz/dartz.dart';
import 'package:commons/commons.dart';

import 'package:tv_series/tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'tv_list_notifier_test.mocks.dart';

@GenerateMocks([GetOnTheAirTVSeries, GetPopularTVSeries, GetTopTVSeries])
void main() {
  late TVListNotifier provider;
  late MockGetOnTheAirTVSeries mockGetOnTheAirTVSeries;
  late MockGetPopularTVSeries mockGetPopularTVSeries;
  late MockGetTopTVSeries mockGetTopTVSeries;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetOnTheAirTVSeries = MockGetOnTheAirTVSeries();
    mockGetPopularTVSeries = MockGetPopularTVSeries();
    mockGetTopTVSeries = MockGetTopTVSeries();

    provider = TVListNotifier(
        getOnTheAirTVSeries: mockGetOnTheAirTVSeries,
        getPopularTVSeries: mockGetPopularTVSeries,
        getTopTVSeries: mockGetTopTVSeries)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  group('Get On The Air TV', () {
    test('InitialState should be empty', () {
      expect(provider.onTheAirTVState, equals(RequestState.Empty));
    });

    test('Should change state to loading when usecase called', () {
      // arrange
      when(mockGetOnTheAirTVSeries.execute())
          .thenAnswer((_) async => Right(tTvList));
      // act
      provider.fetchOnTheAirTV();
      // assert
      expect(provider.onTheAirTVState, RequestState.Loading);
    });

    test('Should get data from usecase', () async {
      // arrange
      when(mockGetOnTheAirTVSeries.execute())
          .thenAnswer((_) async => Right(tTvList));
      // act
      provider.fetchOnTheAirTV();
      // assert
      verify(mockGetOnTheAirTVSeries.execute());
    });

    test('Should change TV when data is gotten successfully', () async {
      // arrange
      when(mockGetOnTheAirTVSeries.execute())
          .thenAnswer((_) async => Right(tTvList));
      // act
      await provider.fetchOnTheAirTV();
      // assert
      expect(provider.onTheAirTVState, RequestState.Loaded);
      expect(provider.onTheAirTV, tTvList);
      expect(listenerCallCount, 2);
    });

    test('Should return error when data is unsucsessfully', () async {
      // arrange
      when(mockGetOnTheAirTVSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure!')));
      // act
      await provider.fetchOnTheAirTV();
      // assert
      expect(provider.onTheAirTVState, RequestState.Error);
      expect(provider.message, 'Server Failure!');
      expect(listenerCallCount, 2);
    });
  });

  group('Get On The Popular TV', () {
    test('InitialState should be empty', () {
      expect(provider.onPopularTVState, equals(RequestState.Empty));
    });

    test('Should change state to loading when usecase called', () {
      // arrange
      when(mockGetPopularTVSeries.execute())
          .thenAnswer((_) async => Right(tTvList));
      // act
      provider.fetchPopularTV();
      // assert
      expect(provider.onPopularTVState, RequestState.Loading);
    });

    test('Should get data from usecase', () async {
      // arrange
      when(mockGetPopularTVSeries.execute())
          .thenAnswer((_) async => Right(tTvList));
      // act
      provider.fetchPopularTV();
      // assert
      verify(mockGetPopularTVSeries.execute());
    });

    test('Should change TV when data is gotten successfully', () async {
      // arrange
      when(mockGetPopularTVSeries.execute())
          .thenAnswer((_) async => Right(tTvList));
      // act
      await provider.fetchPopularTV();
      // assert
      expect(provider.onPopularTVState, RequestState.Loaded);
      expect(provider.onPopularTV, tTvList);
      expect(listenerCallCount, 2);
    });

    test('Should return error when data is unsucsessfully', () async {
      // arrange
      when(mockGetPopularTVSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure!')));
      // act
      await provider.fetchPopularTV();
      // assert
      expect(provider.onPopularTVState, RequestState.Error);
      expect(provider.message, 'Server Failure!');
      expect(listenerCallCount, 2);
    });
  });

  group('Get On The Top Rated TV', () {
    test('InitialState should be empty', () {
      expect(provider.topRatedTVState, equals(RequestState.Empty));
    });

    test('Should change state to loading when usecase called', () {
      // arrange
      when(mockGetTopTVSeries.execute())
          .thenAnswer((_) async => Right(tTvList));
      // act
      provider.fetchTopRatedTV();
      // assert
      expect(provider.topRatedTVState, RequestState.Loading);
    });

    test('Should get data from usecase', () async {
      // arrange
      when(mockGetTopTVSeries.execute())
          .thenAnswer((_) async => Right(tTvList));
      // act
      provider.fetchTopRatedTV();
      // assert
      verify(mockGetTopTVSeries.execute());
    });

    test('Should change TV when data is gotten successfully', () async {
      // arrange
      when(mockGetTopTVSeries.execute())
          .thenAnswer((_) async => Right(tTvList));
      // act
      await provider.fetchTopRatedTV();
      // assert
      expect(provider.topRatedTVState, RequestState.Loaded);
      expect(provider.topRatedTV, tTvList);
      expect(listenerCallCount, 2);
    });

    test('Should return error when data is unsucsessfully', () async {
      // arrange
      when(mockGetTopTVSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure!')));
      // act
      await provider.fetchTopRatedTV();
      // assert
      expect(provider.topRatedTVState, RequestState.Error);
      expect(provider.message, 'Server Failure!');
      expect(listenerCallCount, 2);
    });
  });
}
