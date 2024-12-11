import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_flutter/core/constants/api_url.dart';
import 'package:movie_app_flutter/core/network/dio_client.dart';
import 'package:movie_app_flutter/data/auth/models/signin_req_params.dart';
import 'package:movie_app_flutter/data/auth/models/signup_req_params.dart';
import 'package:movie_app_flutter/service_locator.dart';

abstract class AuthService {
  Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);
}

class AuthApiServiceImpl extends AuthService {
  // Signup
  Future<Either> signup(SignupReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap(),
      );

      return Right(response.data);
    } on DioException catch (e) {
      // This error is come from server
      return Left(e.response!.data['message'] ??
          'An unknown error occurred in data repository signup');
    }
  }

  // Signin
  @override
  Future<Either> signin(SigninReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signin,
        data: params.toMap(),
      );

      return Right(response.data);
    } on DioException catch (e) {
      // This error is come from server
      return Left(e.response!.data['message'] ??
          'An unknown error occurred in data repository signin');
    }
  }
}
