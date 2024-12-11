import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_flutter/core/constants/api_url.dart';
import 'package:movie_app_flutter/core/network/dio_client.dart';
import 'package:movie_app_flutter/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getMovieTrailer(int movieId);
  Future<Either> getRecommendationMovies(int movieId);
  Future<Either> getSimilarMovies(int movieId);
  Future<Either> searchMovie  (String query);
}

class MovieApiServiceImpl extends MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.trendingMovies,
      );

      return Right(response.data);
    } on DioException catch (e) {
      // This error is come from server
      return Left(e.response!.data['message'] ??
          'An unknown error occurred in data repository trending movie, get trending movies');
    }
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.nowPlayingMovies,
      );

      return Right(response.data);
    } on DioException catch (e) {
      // This error is come from server
      return Left(e.response!.data['message'] ??
          'An unknown error occurred in data repository trending movie, get now playing movies');
    }
  }
  
  @override
  Future<Either> getMovieTrailer(int movieId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.movie}$movieId/trailer',
      );

      return Right(response.data);
    } on DioException catch (e) {
      // This error is come from server
      return Left(e.response!.data['message'] ??
          'An unknown error occurred in data repository trending movie, get movie trailer');
    }
  }
  
  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.movie}$movieId/recommendations',
      );

      return Right(response.data);
    } on DioException catch (e) {
      // This error is come from server
      return Left(e.response!.data['message'] ??
          'An unknown error occurred in data repository trending movie, get recommendation movie');
    }
  }
  
  @override
  Future<Either> getSimilarMovies(int movieId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.movie}$movieId/similar',
      );

      return Right(response.data);
    } on DioException catch (e) {
      // This error is come from server
      return Left(e.response!.data['message'] ??
          'An unknown error occurred in data repository trending movie, get similar movie');
    }
  }
  
  @override
  Future<Either> searchMovie(String query) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.search}movie/$query',
      );

      return Right(response.data);
    } on DioException catch (e) {
      // This error is come from server
      return Left(e.response!.data['message'] ??
          'An unknown error occurred in data repository movie, get query movie');
    }
  }
}
