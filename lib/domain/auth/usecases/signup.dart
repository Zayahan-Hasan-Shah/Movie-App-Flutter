import 'package:dartz/dartz.dart';
import 'package:movie_app_flutter/core/usecase/usecase.dart';
import 'package:movie_app_flutter/data/auth/models/signup_req_params.dart';
import 'package:movie_app_flutter/domain/auth/repositories/auth.dart';
import 'package:movie_app_flutter/service_locator.dart';

class SignupUseCase extends Usecase<Either, SignupReqParams> {
  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
