import 'dart:io';
import 'package:commons/commons.dart';

import 'package:dartz/dartz.dart';
import 'package:tv_series/data/datasources/tv_local_data_source.dart';
import 'package:tv_series/data/datasources/tv_remote_data_source.dart';
import 'package:tv_series/data/models/tv_table.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';

class TVRepositoryImpl implements TVRepository {
  final TVRemoteDataSource remoteDataSource;
  final TVLocalDataSource localDataSource;

  TVRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, List<TV>>> getOnTheAirTV() async {
    try {
      final result = await remoteDataSource.getOnTheAirTV();
      return Right(result.map((data) => data.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the Network'));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getPopularTV() async {
    try {
      final result = await remoteDataSource.getPopularTV();
      return Right(result.map((data) => data.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the Network'));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getRecommendationTV(int id) async {
    try {
      final result = await remoteDataSource.getTVRecommendations(id);
      return Right(result.map((data) => data.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the Network'));
    }
  }

  @override
  Future<Either<Failure, TvDetail>> getTVDetail(int id) async {
    try {
      final result = await remoteDataSource.getTVDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the Network'));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getTopRatedTV() async {
    try {
      final result = await remoteDataSource.getTopRatedTV();
      return Right(result.map((data) => data.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the Network'));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getWatchlistTV() async {
    final result = await localDataSource.getWatchlistTV();
    return Right(result.map((data) => data.toEntity()).toList());
  }

  @override
  Future<bool> isAddedToWatchlist(int id) async {
    final result = await localDataSource.getTVById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, String>> removeWatchlist(TvDetail tv) async {
    try {
      final result =
          await localDataSource.removeWatchlistTV(TVTable.fromEntity(tv));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlist(TvDetail tv) async {
    try {
      final result =
          await localDataSource.insertWatchlistTV(TVTable.fromEntity(tv));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<TV>>> searchTV(String query) async {
    try {
      final result = await remoteDataSource.searchTV(query);
      return Right(result.map((data) => data.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the Network'));
    }
  }
}
