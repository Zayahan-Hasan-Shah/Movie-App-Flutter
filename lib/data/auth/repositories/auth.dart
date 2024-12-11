import 'package:dartz/dartz.dart';
import 'package:movie_app_flutter/data/auth/models/signin_req_params.dart';
import 'package:movie_app_flutter/data/auth/models/signup_req_params.dart';
import 'package:movie_app_flutter/data/auth/sources/auth_api_service.dart';
import 'package:movie_app_flutter/domain/auth/repositories/auth.dart';
import 'package:movie_app_flutter/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignupReqParams params) async {
    var data = await sl<AuthService>().signup(params);
    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['user']['token']);
      return Right(data);
    });
    // return await sl<AuthApiService>().signup(params);
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    var data = await sl<AuthService>().signin(params);
    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['user']['token']);
      return Right(data);
    });
    // return await sl<AuthApiService>().signin(params);
  }

  @override
  Future<bool> isLoggedin() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}
