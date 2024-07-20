import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/login/presentation/bloc/login_bloc.dart';
import 'package:weather_app/modules/login/presentation/widgets/login_form.dart';
import 'package:weather_app/modules/register/presentation/widgets/continue_options.dart';
import 'package:weather_app/utils/components/app_typography.dart';
import 'package:weather_app/utils/components/ui_helpers.dart';

class LoginMobileView extends StatefulWidget {
  const LoginMobileView({super.key});

  @override
  State<LoginMobileView> createState() => _LoginMobileViewState();
}

class _LoginMobileViewState extends State<LoginMobileView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UIHelpers.verticalSpaceMedium,
                  Text(
                    'Login here',
                    style: AppTypography.text26BlueBold,
                    textAlign: TextAlign.center,
                  ),
                  UIHelpers.verticalSpaceMedium,
                  Text(
                    'Welcome to Accurate\nWeather Insights',
                    style: AppTypography.text16BlackBold,
                    textAlign: TextAlign.center,
                  ),
                  UIHelpers.verticalSpaceHuge,
                  LoginForm(
                    emailController: emailController,
                    passController: passController,
                  ),
                  UIHelpers.verticalSpaceMedium,
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      'Create new account',
                      style: AppTypography.text16Black,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  UIHelpers.verticalSpaceHuge,
                  Text(
                    'or continue with',
                    style: AppTypography.text16Blue,
                    textAlign: TextAlign.center,
                  ),
                  UIHelpers.verticalSpaceMedium,
                  const ContinueOptions(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
