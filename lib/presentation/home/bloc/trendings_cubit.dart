import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_app_flutter/presentation/home/bloc/trendings_state.dart';
import 'package:movie_app_flutter/service_locator.dart';

class TrendingsCubit extends Cubit<TrendingsState> {
  TrendingsCubit() : super(TrendingsMoviesLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUseCase>().call();
    returnedData.fold((error) {
      emit(FailureLoadTrendingsMovies(errorMessage: error));
    }, (data) {
      emit(TrendingsMoviesLoaded(movies: data));
    });
  }
}
