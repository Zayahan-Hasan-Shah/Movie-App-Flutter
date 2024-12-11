import 'package:dartz/dartz.dart';
import 'package:movie_app_flutter/core/usecase/usecase.dart';
import 'package:movie_app_flutter/domain/movie/repositories/movie.dart';
import 'package:movie_app_flutter/service_locator.dart';

class GetNowPlayingMoviesUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getNowPlayingMovies();
  }
}
