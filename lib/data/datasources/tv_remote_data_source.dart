import 'dart:convert';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/tv/tv_response.dart';
import 'package:http/http.dart' as http;

import 'package:ditonton/data/models/tv/tv_detail_model.dart';
import 'package:ditonton/data/models/tv/tv_model.dart';

abstract class TVRemoteDataSource {
  Future<List<TVModel>> getOnTheAirTV();
  Future<List<TVModel>> getPopularTV();
  Future<List<TVModel>> getTopRatedTV();
  Future<TVDetailModel> getTVDetail(int id);
  Future<List<TVModel>> getTVRecommendations(int id);
  Future<List<TVModel>> searchTV(String query);
}

class TVRemoteDataSourceImpl implements TVRemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final http.Client client;

  TVRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TVModel>> getOnTheAirTV() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'));

    if (response.statusCode != 200) throw ServerException();

    return TVResponse.fromJson(json.decode(response.body)).tvlist;
  }

  @override
  Future<List<TVModel>> getPopularTV() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'));

    if (response.statusCode != 200) throw ServerException();

    return TVResponse.fromJson(json.decode(response.body)).tvlist;
  }

  @override
  Future<TVDetailModel> getTVDetail(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/id$id?$API_KEY'));

    if (response.statusCode != 200) throw ServerException();

    return TVDetailModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<TVModel>> getTVRecommendations(int id) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY'));

    if (response.statusCode != 200) throw ServerException();

    return TVResponse.fromJson(json.decode(response.body)).tvlist;
  }

  @override
  Future<List<TVModel>> getTopRatedTV() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'));

    if (response.statusCode != 200) throw ServerException();

    return TVResponse.fromJson(json.decode(response.body)).tvlist;
  }

  @override
  Future<List<TVModel>> searchTV(String query) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query'));

    if (response.statusCode != 200) throw ServerException();

    return TVResponse.fromJson(json.decode(response.body)).tvlist;
  }
}
