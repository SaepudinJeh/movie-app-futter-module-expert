import 'dart:convert';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
import 'package:ditonton/data/models/tv/tv_detail_model.dart';
import 'package:ditonton/data/models/tv/tv_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../helpers/test_helper.mocks.dart';
import '../../../json_reader.dart';

void main() {
  const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  const BASE_URL = 'https://api.themoviedb.org/3';

  late TVRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() => {
        mockHttpClient = MockHttpClient(),
        dataSource = TVRemoteDataSourceImpl(client: mockHttpClient)
      });

  group('Get on the air TV', () {
    final tTVList = TVResponse.fromJson(
            json.decode(readJson('dummy_data/tv_json/on_the_air.json')))
        .tvlist;

    test('Should return list of on the airing TV when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/tv_json/on_the_air.json'), 200));
      // act
      final result = await dataSource.getOnTheAirTV();
      // assert
      expect(result, equals(tTVList));
    });

    test('Should throw a ServerExeption when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final result = dataSource.getOnTheAirTV();
      // assert
      expect(() => result, throwsA(isA<ServerException>()));
    });
  });

  group('Get on TV detail', () {
    final tId = 1;
    final tTVDetail = TVDetailModel.fromJson(
        json.decode(readJson('dummy_data/tv_json/tv_detail.json')));

    test('Should return TV detail when status code is 200', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/id$tId?$API_KEY')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/tv_json/tv_detail.json'), 200));
      // act
      final result = await dataSource.getTVDetail(tId);
      // assert
      expect(result, equals(tTVDetail));
    });

    test(
        'Should throw Server Exception when response code 404 or other in TV detail',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/id$tId?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getTVDetail(tId);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
