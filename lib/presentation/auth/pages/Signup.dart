import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app_flutter/common/helper/message/display_message.dart';
import 'package:movie_app_flutter/common/helper/navigation/app_navigation.dart';
import 'package:movie_app_flutter/core/configs/theme/app_color.dart';
import 'package:movie_app_flutter/data/auth/models/signup_req_params.dart';
import 'package:movie_app_flutter/domain/auth/usecases/signup.dart';
import 'package:movie_app_flutter/presentation/auth/pages/signin.dart';
import 'package:movie_app_flutter/presentation/home/pages/home.dart';
import 'package:movie_app_flutter/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _paswordController = TextEditingController();
  SignupPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.only(
            top: 100,
            right: 16,
            left: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signupText(),
              const SizedBox(
                height: 30,
              ),
              _emailField(),
              const SizedBox(
                height: 15,
              ),
              _passwordField(),
              const SizedBox(
                height: 75,
              ),
              _sigupButton(context),
              const SizedBox(
                height: 15,
              ),
              _signinText(context),
            ],
          )),
    );
  }

  Widget _signupText() {
    return const Text(
      'Sign Up',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _paswordController,
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
    );
  }

  Widget _sigupButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async {
        await sl<SignupUseCase>().call(
          params: SignupReqParams(
            email: _emailController.text,
            password: _paswordController.text,
          ),
        );
      },
      onSuccess: () {
        AppNavigator.pushAndRemove(context, const HomePage());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        const TextSpan(
          text: "Do you have an account?",
        ),
        TextSpan(
          text: " Sign In",
          style: const TextStyle(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, SigninPage());
            },
        ),
      ]),
    );
  }
}
