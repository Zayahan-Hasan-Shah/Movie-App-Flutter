import 'package:dartz/dartz.dart';
import 'package:movie_app_flutter/core/usecase/usecase.dart';
import 'package:movie_app_flutter/data/auth/models/signin_req_params.dart';
import 'package:movie_app_flutter/domain/auth/repositories/auth.dart';
import 'package:movie_app_flutter/service_locator.dart';

class SigninUseCase extends Usecase<Either, SigninReqParams> {
  @override
  Future<Either> call({SigninReqParams? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}
