import 'dart:io';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class TVRepositoryImpl implements TVRepository {
  final TVRemoteDataSource remoteDataSource;

  TVRepositoryImpl({required this.remoteDataSource});

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
  Future<Either<Failure, List<TV>>> getWatchlistTV() {
    // TODO: implement getWatchlistTV
    throw UnimplementedError();
  }

  @override
  Future<bool> isAddedToWatchlist(int id) {
    // TODO: implement isAddedToWatchlist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> removeWatchlist(TvDetail tv) {
    // TODO: implement removeWatchlist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> saveWatchlist(TvDetail tv) {
    // TODO: implement saveWatchlist
    throw UnimplementedError();
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
