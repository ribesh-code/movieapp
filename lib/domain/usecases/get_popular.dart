import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/domain/repositories/movie_repo.dart';
import 'package:movieapp/domain/usecases/usecase.dart';

class GetPopularMovies extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepo movieRepo;
  GetPopularMovies({required this.movieRepo});

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await movieRepo.getPopular();
  }
}
