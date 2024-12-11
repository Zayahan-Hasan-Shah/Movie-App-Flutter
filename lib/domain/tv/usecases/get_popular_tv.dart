import 'package:dartz/dartz.dart';
import 'package:movie_app_flutter/core/usecase/usecase.dart';
import 'package:movie_app_flutter/domain/tv/repositories/tv.dart';
import 'package:movie_app_flutter/service_locator.dart';

class GetPopularTVUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<TVRepository>().getPopularTV();
  }
}
