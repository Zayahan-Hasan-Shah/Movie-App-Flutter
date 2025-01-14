import 'package:movie_app_flutter/domain/movie/entities/movie.dart';

abstract class TrendingsState {}

class TrendingsMoviesLoading extends TrendingsState {}

class TrendingsMoviesLoaded extends TrendingsState {
  final List<MovieEntity> movies;
  TrendingsMoviesLoaded({required this.movies});
}

class FailureLoadTrendingsMovies extends TrendingsState {
  final String errorMessage;
  FailureLoadTrendingsMovies({required this.errorMessage});
}
