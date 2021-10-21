part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();

  @override
  List<Object> get props => [];
}

class MovieCarouselInitial extends MovieCarouselState {}

class MovieCarouselError extends MovieCarouselState {
  final String message;
  const MovieCarouselError({required this.message});
  @override
  List<Object> get props => [message];
}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselLoaded({required this.movies, this.defaultIndex = 0});
  @override
  List<Object> get props => [movies, defaultIndex];
}
