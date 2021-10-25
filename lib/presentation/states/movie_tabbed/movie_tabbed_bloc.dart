import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/domain/usecases/get_comming_soon.dart';
import 'package:movieapp/domain/usecases/get_playing_now.dart';
import 'package:movieapp/domain/usecases/get_popular.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopularMovies getPopularMovies;
  final GetPlayingNowMovies getPlayingNowMovies;
  final GetCommingSoonMovies getCommingSoonMovies;
  MovieTabbedBloc(
      {required this.getPopularMovies,
      required this.getPlayingNowMovies,
      required this.getCommingSoonMovies})
      : super(MovieTabbedInitial());

  @override
  Stream<MovieTabbedState> mapEventToState(
    MovieTabbedEvent event,
  ) async* {
    if (event is MovieTabChangedEvent) {
      Either<AppError, List<MovieEntity>>? moviesEither;
      switch (event.currentTabIndex) {
        case 0:
          moviesEither = await getPopularMovies(NoParams());
          break;

        case 1:
          moviesEither = await getPlayingNowMovies(NoParams());
          break;

        case 2:
          moviesEither = await getCommingSoonMovies(NoParams());
          break;
      }
      yield moviesEither!.fold(
          (l) => MovieTabLoadError(currentTabIndex: event.currentTabIndex),
          (r) {
        return MovieTabChanged(
            movies: r, currentTabIndex: event.currentTabIndex);
      });
    }
  }
}
