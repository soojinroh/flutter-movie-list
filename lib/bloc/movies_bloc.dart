import 'dart:async';

import 'package:flutter_movie_list/api/src/api_provider.dart';
import 'package:flutter_movie_list/model/src/movie.dart';
import 'package:flutter_movie_list/repository/repository.dart';

class MoviesBloc {

  final movieRepository = MovieRepository(apiProvider: ApiProviderImpl());

  final StreamController<MovieList> movieBloc = StreamController<MovieList>.broadcast();

  getNowPlayingMovies() async {
    var nowPlayingMovies = await movieRepository.getNowPlaying();
    movieBloc.sink.add(nowPlayingMovies);
  }

  getUpcomingMovies() async {
    var nowPlayingMovies = await movieRepository.getUpcoming();
    movieBloc.sink.add(nowPlayingMovies);
  }

  getPopularMovies() async {
    var nowPlayingMovies = await movieRepository.getPopular();
    movieBloc.sink.add(nowPlayingMovies);
  }

}
