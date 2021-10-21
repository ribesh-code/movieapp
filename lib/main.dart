// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movieapp/data/core/api_client.dart';
import 'package:movieapp/data/data_source/remote/movie_remote_data_source.dart';
import 'package:movieapp/data/respositories/movie_repo_impl.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/domain/repositories/movie_repo.dart';
import 'package:movieapp/domain/usecases/get_trending.dart';

void main() async {
  Client _http = Client();
  ApiClient apiClient = ApiClient(_http);
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  MovieRepo movieRepo = MovieRepoImpl(movieRemoteDataSource: dataSource);
  GetTrending getTrending = GetTrending(movieRepo: movieRepo);
  final Either<AppError, List<MovieEntity>> eitherResponse =
      await getTrending(NoParams());
  eitherResponse.fold((l) {
    print('left has been called');
    print(l);
  }, (r) {
    print('right called');
    print(r);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
