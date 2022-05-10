import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/repositories/tv_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late TVRepositoryImpl repository;
  late MockTVRemoteDataSource mockTVRemoteDataSource;

  setUp(() {
    mockTVRemoteDataSource = MockTVRemoteDataSource();
    repository = TVRepositoryImpl(remoteDataSource: mockTVRemoteDataSource);
  });

  group('On The Air TV', () {
    test('Should return list on the air TV when call to data source is success',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getOnTheAirTV())
          .thenAnswer((_) async => tTVmodelList);
      // act
      final result = await repository.getOnTheAirTV();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvList);
    });

    test(
        'Should return server failure when call to data source is unsuccessfully',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getOnTheAirTV()).thenThrow(ServerException());
      // act
      final result = await repository.getOnTheAirTV();
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'Should return connection failure when device is not connection to the internet',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getOnTheAirTV())
          .thenThrow(SocketException('Failed to connect to the Network'));
      // act
      final result = await repository.getOnTheAirTV();
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the Network')));
    });
  });

  group('Popular TV', () {
    test('Should return list popular TV when call to data source is success',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getPopularTV())
          .thenAnswer((_) async => tTVmodelList);
      // act
      final result = await repository.getPopularTV();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvList);
    });

    test(
        'Should return server failure when call to data source is unsuccessfully',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getPopularTV()).thenThrow(ServerException());
      // act
      final result = await repository.getPopularTV();
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'Should return connection failure when device is not connection to the internet',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getPopularTV())
          .thenThrow(SocketException('Failed to connect to the Network'));
      // act
      final result = await repository.getPopularTV();
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the Network')));
    });
  });

  group('Recommendation TV', () {
    test(
        'Should return list recommendation TV when call to data source is success',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTVRecommendations(tId))
          .thenAnswer((_) async => tTVmodelList);
      // act
      final result = await repository.getRecommendationTV(tId);
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvList);
    });

    test(
        'Should return server failure when call to data source is unsuccessfully',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTVRecommendations(tId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getRecommendationTV(tId);
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'Should return connection failure when device is not connection to the internet',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTVRecommendations(tId))
          .thenThrow(SocketException('Failed to connect to the Network'));
      // act
      final result = await repository.getRecommendationTV(tId);
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the Network')));
    });
  });

  group('Detail TV', () {
    test('Should return detail TV when call to data source is success',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTVDetail(tId))
          .thenAnswer((_) async => tTVDetailModel);
      // act
      final result = await repository.getTVDetail(tId);
      // assert
      expect(result, equals(Right(tTVDetail)));
    });

    test(
        'Should return server failure when call to data source is unsuccessfully',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTVDetail(tId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getTVDetail(tId);
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'Should return connection failure when device is not connection to the internet',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTVDetail(tId))
          .thenThrow(SocketException('Failed to connect to the Network'));
      // act
      final result = await repository.getTVDetail(tId);
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the Network')));
    });
  });

  group('Top Rated TV', () {
    test('Should return list top rated TV when call to data source is success',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTopRatedTV())
          .thenAnswer((_) async => tTVmodelList);
      // act
      final result = await repository.getTopRatedTV();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, equals(tTvList));
    });

    test(
        'Should return server failure when call to data source is unsuccessfully',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTopRatedTV()).thenThrow(ServerException());
      // act
      final result = await repository.getTopRatedTV();
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'Should return connection failure when device is not connection to the internet',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTopRatedTV())
          .thenThrow(SocketException('Failed to connect to the Network'));
      // act
      final result = await repository.getTopRatedTV();
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the Network')));
    });
  });

  group('Search TV', () {
    test('Should return list search TV when call to data source is success',
        () async {
      // arrange
      when(mockTVRemoteDataSource.searchTV(tQuery))
          .thenAnswer((_) async => tTVmodelList);
      // act
      final result = await repository.searchTV(tQuery);
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, equals(tTvList));
    });

    test(
        'Should return server failure when call to data source is unsuccessfully',
        () async {
      // arrange
      when(mockTVRemoteDataSource.searchTV(tQuery))
          .thenThrow(ServerException());
      // act
      final result = await repository.searchTV(tQuery);
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'Should return connection failure when device is not connection to the internet',
        () async {
      // arrange
      when(mockTVRemoteDataSource.searchTV(tQuery))
          .thenThrow(SocketException('Failed to connect to the Network'));
      // act
      final result = await repository.searchTV(tQuery);
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the Network')));
    });
  });
}
