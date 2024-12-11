import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_flutter/core/constants/api_url.dart';
import 'package:movie_app_flutter/core/network/dio_client.dart';
import 'package:movie_app_flutter/service_locator.dart';

abstract class TVServices {
  Future<Either> getPopularTV();
  Future<Either> getRecommendationTVs(int tvId);
  Future<Either> getSimilarTVs(int tvId);
  Future<Either> getKeywords(int tvId);
  Future<Either> searchTV(String query);
}


class TVApiSeriesImpl extends TVServices {
  @override
  Future<Either> getPopularTV() async {
       try {
      var response = await sl<DioClient>().get(
        ApiUrl.popularTV,
      );

      return Right(response.data);
    } on DioException catch (e) {
      // This error is come from server
      return Left(e.response!.data['message'] ??
          'An unknown error occurred in data tv series');
    }
  }
  
  @override
  Future<Either> getRecommendationTVs(int tvId) async {
     try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/recommendations',
      );

      return Right(response.data);
    } on DioException catch (e) {
      // This error is come from server
      return Left(e.response!.data['message'] ??
          'An unknown error occurred in data repository tv, get recommendation tv');
    }
  }
  
  @override
  Future<Either> getSimilarTVs(int tvId) async {
   try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/similar',
      );

      return Right(response.data);
    } on DioException catch (e) {
      // This error is come from server
      return Left(e.response!.data['message'] ??
          'An unknown error occurred in data repository tv, get similar tv');
    }
  }
  
  @override
  Future<Either> getKeywords(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/keywords',
      );

      return Right(response.data);
    } on DioException catch (e) {
      // This error is come from server
      return Left(e.response!.data['message'] ??
          'An unknown error occurred in data repository tv, get keywords tv');
    }
  }
  
  @override
  Future<Either> searchTV(String query) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.search}tv/$query',
      );

      return Right(response.data);
    } on DioException catch (e) {
      // This error is come from server
      return Left(e.response!.data['message'] ??
          'An unknown error occurred in data repository tv, get query tv');
    }
  }
  
}