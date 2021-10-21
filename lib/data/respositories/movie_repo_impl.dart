import 'package:dartz/dartz.dart';
import 'package:movieapp/data/data_source/remote/movie_remote_data_source.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/repositories/movie_repo.dart';

class MovieRepoImpl extends MovieRepo {
  final MovieRemoteDataSource movieRemoteDataSource;
  MovieRepoImpl({required this.movieRemoteDataSource});

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final trendingMovies = await movieRemoteDataSource.getTrending();
      return Right(trendingMovies);
    } on Exception {
      return const Left(
        AppError(message: 'Cannot Get Trending Movies'),
      );
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getCommingSoon() async {
    try {
      final commingSoon = await movieRemoteDataSource.getCommingSoon();
      return Right(commingSoon);
    } on Exception {
      return const Left(
        AppError(
          message: ('Cannot Get Comming Soon Movies'),
        ),
      );
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final playingNow = await movieRemoteDataSource.getPlayingNow();
      return Right(playingNow);
    } on Exception {
      return const Left(AppError(message: 'Cannot Get Playing Now Movies'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final popularMovies = await movieRemoteDataSource.getPopular();
      return Right(popularMovies);
    } on Exception {
      return const Left(
        AppError(message: 'Cannot Get Popular Movies.'),
      );
    }
  }
}
