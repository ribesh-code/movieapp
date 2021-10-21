import 'package:movieapp/data/data_source/remote/movie_remote_data_source.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/repositories/movie_repo.dart';

class MovieRepoImpl extends MovieRepo {
  final MovieRemoteDataSource movieRemoteDataSource;
  MovieRepoImpl({required this.movieRemoteDataSource});

  @override
  Future<List<MovieModel>> getTrending() async {
    try {
      final movies = await movieRemoteDataSource.getTrending();
      return movies;
    } on Exception {
      throw Exception('cannot fecth');
    }
  }
}
