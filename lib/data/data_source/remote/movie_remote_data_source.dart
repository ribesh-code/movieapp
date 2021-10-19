// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:movieapp/data/core/api_client.dart';
import 'package:movieapp/data/core/api_constanst.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final responseBody = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(responseBody).results;
    print(movies);
    return movies!;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final responseBody = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(responseBody).results;
    print(movies);
    return movies!;
  }
}
