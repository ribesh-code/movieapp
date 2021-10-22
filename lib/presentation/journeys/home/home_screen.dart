import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/di/get_it.dart';
import 'package:movieapp/presentation/journeys/home/movie_carousel/movie_carousel_widget.dart';
import 'package:movieapp/presentation/states/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movieapp/presentation/states/movie_carousel/movie_carousel_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;
  late MovieBackdropBloc movieBackdropBloc;
  @override
  void initState() {
    movieCarouselBloc = getInstance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    movieCarouselBloc.add(const CarouselLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    movieCarouselBloc.close();
    movieBackdropBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieCarouselBloc,
        ),
        BlocProvider(
          create: (context) => movieBackdropBloc,
        ),
      ],
      child: Scaffold(
          body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
        bloc: movieCarouselBloc,
        builder: (context, state) {
          if (state is MovieCarouselLoaded) {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarouselWidget(
                      movies: state.movies,
                      defaultIndex: state.defaultIndex,
                    )),
                const FractionallySizedBox(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 0.4,
                  child: Placeholder(
                    color: Colors.white,
                  ),
                )
              ],
            );
          }
          return SizedBox.shrink();
        },
      )),
    );
  }
}
