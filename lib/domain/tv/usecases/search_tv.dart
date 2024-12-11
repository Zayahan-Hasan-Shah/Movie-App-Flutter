import 'package:dartz/dartz.dart';
import 'package:movie_app_flutter/core/usecase/usecase.dart';
import 'package:movie_app_flutter/domain/tv/repositories/tv.dart';
import 'package:movie_app_flutter/service_locator.dart';

class SearchTVsUseCase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<TVRepository>().searchTV(params!);
  }
}
