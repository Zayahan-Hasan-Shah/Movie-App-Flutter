import 'package:dartz/dartz.dart';
import 'package:movie_app_flutter/core/usecase/usecase.dart';
import 'package:movie_app_flutter/domain/movie/repositories/movie.dart';
import 'package:movie_app_flutter/service_locator.dart';

class SearchMoviesUseCase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<MovieRepository>().searchMovie(params!);
  }
}
