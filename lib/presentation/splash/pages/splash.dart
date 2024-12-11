import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/common/helper/navigation/app_navigation.dart';
import 'package:movie_app_flutter/core/configs/assets/app_images.dart';
import 'package:movie_app_flutter/presentation/auth/pages/signin.dart';
import 'package:movie_app_flutter/presentation/home/pages/home.dart';
import 'package:movie_app_flutter/presentation/splash/bloc/splash_cubit.dart';
import 'package:movie_app_flutter/presentation/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            AppNavigator.pushReplacement(context, SigninPage());
          }
          if (state is Authenticated) {
            AppNavigator.pushReplacement(context, const HomePage());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.splashBackground,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xff1A1B20).withOpacity(0),
                    const Color(0xff1A1B20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
