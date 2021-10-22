import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/screen_utils/screen_utils.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/presentation/journeys/home/movie_carousel/animated_movie_card_widget.dart';
import 'package:movieapp/presentation/states/movie_backdrop/movie_backdrop_bloc.dart';
import '../../../../common/extension/size_extension.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;
  const MoviePageView({
    Key? key,
    required this.movies,
    required this.initialPage,
  }) : super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: widget.initialPage, keepPage: true, viewportFraction: 0.7);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_12.h.toDouble()),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final MovieEntity movie = widget.movies[index];
          return AnimatedMovieCardWidget(
              index: index,
              pageController: _pageController!,
              movieId: movie.id,
              posterPath: movie.posterPath!);
        },
        pageSnapping: true,
        itemCount: widget.movies.length,
        onPageChanged: (index) {
          BlocProvider.of<MovieBackdropBloc>(context)
              .add(MovieBackDropChangedEvent(movie: widget.movies[index]));
        },
      ),
    );
  }
}
