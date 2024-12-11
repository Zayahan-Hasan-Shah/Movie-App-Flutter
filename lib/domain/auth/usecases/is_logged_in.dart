import 'package:movie_app_flutter/core/usecase/usecase.dart';
import 'package:movie_app_flutter/domain/auth/repositories/auth.dart';
import 'package:movie_app_flutter/service_locator.dart';

class IsLoggedInUsecase extends Usecase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedin();
  }
}
