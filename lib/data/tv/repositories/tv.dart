import 'package:dartz/dartz.dart';
import 'package:movie_app_flutter/common/helper/mapper/keyword.dart';
import 'package:movie_app_flutter/common/helper/mapper/tv.dart';
import 'package:movie_app_flutter/core/models/keyword.dart';
import 'package:movie_app_flutter/data/tv/models/tv.dart';
import 'package:movie_app_flutter/data/tv/sources/tv.dart';
import 'package:movie_app_flutter/domain/tv/repositories/tv.dart';
import 'package:movie_app_flutter/service_locator.dart';

class TVRepositoryImpl extends TVRepository {
  @override
  Future<Either> getPopularTV() async {
    var returnedData = await sl<TVServices>().getPopularTV();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getRecommendationTVs(int tvId) async {
    var returnedData = await sl<TVServices>().getRecommendationTVs(tvId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getSimilarTVs(int tvId) async {
    var returnedData = await sl<TVServices>().getSimilarTVs(tvId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getKeywords(int tvId) async {
    var returnedData = await sl<TVServices>().getKeywords(tvId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => Keyword.toEntity(KeywordModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> searchTV(String query) async {
    var returnedData = await sl<TVServices>().searchTV(query);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => Keyword.toEntity(KeywordModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }
}
