import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/repositories/movie_repo.dart';

class GetTrending {
  final MovieRepo movieRepo;
  GetTrending({required this.movieRepo});

  Future<List<MovieEntity>> call() async {
    return await movieRepo.getTrending();
  }
}
