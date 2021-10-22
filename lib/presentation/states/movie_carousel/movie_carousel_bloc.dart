import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/domain/usecases/get_trending.dart';
import 'package:movieapp/presentation/states/movie_backdrop/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc(
      {required this.getTrending, required this.movieBackdropBloc})
      : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(
    MovieCarouselEvent event,
  ) async* {
    if (event is CarouselLoadEvent) {
      final moviesEither = await getTrending(NoParams());
      yield moviesEither.fold(
          (l) => const MovieCarouselError(
                message: 'Something went wrong',
              ), (r) {
        movieBackdropBloc
            .add(MovieBackDropChangedEvent(movie: r[event.defaultIndex]));
        return MovieCarouselLoaded(movies: r, defaultIndex: event.defaultIndex);
      });
    }
  }
}
