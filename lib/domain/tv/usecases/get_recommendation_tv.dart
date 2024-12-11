import 'package:dartz/dartz.dart';
import 'package:movie_app_flutter/core/usecase/usecase.dart';
import 'package:movie_app_flutter/domain/tv/repositories/tv.dart';
import 'package:movie_app_flutter/service_locator.dart';

class GetRecommendationTVsUseCase extends Usecase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<TVRepository>().getRecommendationTVs(params!);
  }
}
