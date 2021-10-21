import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movieapp/data/core/api_client.dart';
import 'package:movieapp/data/data_source/remote/movie_remote_data_source.dart';
import 'package:movieapp/data/respositories/movie_repo_impl.dart';
import 'package:movieapp/domain/repositories/movie_repo.dart';
import 'package:movieapp/domain/usecases/get_comming_soon.dart';
import 'package:movieapp/domain/usecases/get_playing_now.dart';
import 'package:movieapp/domain/usecases/get_popular.dart';
import 'package:movieapp/domain/usecases/get_trending.dart';

final getInstance = GetIt.I;

Future init() async {
  getInstance.registerLazySingleton<Client>(
    () => Client(),
  );
  getInstance.registerLazySingleton<ApiClient>(
    () => ApiClient(
      getInstance(),
    ),
  );
  getInstance.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(
      getInstance(),
    ),
  );
  getInstance.registerLazySingleton<MovieRepo>(
    () => MovieRepoImpl(
      movieRemoteDataSource: getInstance(),
    ),
  );
  getInstance.registerLazySingleton<GetTrending>(
    () => GetTrending(
      movieRepo: getInstance(),
    ),
  );
  getInstance.registerLazySingleton<GetPopularMovies>(
    () => GetPopularMovies(
      movieRepo: getInstance(),
    ),
  );
  getInstance.registerLazySingleton<GetPlayingNowMovies>(
    () => GetPlayingNowMovies(
      movieRepo: getInstance(),
    ),
  );
  getInstance.registerLazySingleton<GetCommingSoonMovies>(
    () => GetCommingSoonMovies(
      movieRepo: getInstance(),
    ),
  );
}
