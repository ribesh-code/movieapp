import 'package:movieapp/domain/entities/movie_entity.dart';

abstract class MovieRepo {
  Future<List<MovieEntity>> getTrending();
}
