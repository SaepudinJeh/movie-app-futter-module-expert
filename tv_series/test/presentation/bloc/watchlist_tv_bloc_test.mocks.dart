// Mocks generated by Mockito 5.2.0 from annotations
// in tv_series/test/presentation/bloc/watchlist_tv_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:commons/commons.dart' as _i6;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tv_series/domain/entities/tv.dart' as _i7;
import 'package:tv_series/domain/entities/tv_detail.dart' as _i9;
import 'package:tv_series/domain/repositories/tv_repository.dart' as _i3;
import 'package:tv_series/domain/usecases/get_watchlist_tv.dart' as _i4;
import 'package:tv_series/domain/usecases/get_watchlist_tv_status.dart' as _i11;
import 'package:tv_series/domain/usecases/remove_watchlist_tv.dart' as _i10;
import 'package:tv_series/domain/usecases/save_watchlist_tv.dart' as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeTVRepository_1 extends _i1.Fake implements _i3.TVRepository {}

/// A class which mocks [GetTVWatchList].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTVWatchList extends _i1.Mock implements _i4.GetTVWatchList {
  MockGetTVWatchList() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
              returnValue: Future<_i2.Either<_i6.Failure, List<_i7.TV>>>.value(
                  _FakeEither_0<_i6.Failure, List<_i7.TV>>()))
          as _i5.Future<_i2.Either<_i6.Failure, List<_i7.TV>>>);
}

/// A class which mocks [SaveTVWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveTVWatchlist extends _i1.Mock implements _i8.SaveTVWatchlist {
  MockSaveTVWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.TVRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTVRepository_1()) as _i3.TVRepository);
  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> execute(_i9.TvDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#execute, [tv]),
              returnValue: Future<_i2.Either<_i6.Failure, String>>.value(
                  _FakeEither_0<_i6.Failure, String>()))
          as _i5.Future<_i2.Either<_i6.Failure, String>>);
}

/// A class which mocks [RemoveWatchlistTVSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveWatchlistTVSeries extends _i1.Mock
    implements _i10.RemoveWatchlistTVSeries {
  MockRemoveWatchlistTVSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.TVRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTVRepository_1()) as _i3.TVRepository);
  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> execute(_i9.TvDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#execute, [tv]),
              returnValue: Future<_i2.Either<_i6.Failure, String>>.value(
                  _FakeEither_0<_i6.Failure, String>()))
          as _i5.Future<_i2.Either<_i6.Failure, String>>);
}

/// A class which mocks [GetWatchListTVStatus].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchListTVStatus extends _i1.Mock
    implements _i11.GetWatchListTVStatus {
  MockGetWatchListTVStatus() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.TVRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeTVRepository_1()) as _i3.TVRepository);
  @override
  _i5.Future<bool> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}
