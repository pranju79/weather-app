import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/login/presentation/bloc/login_bloc.dart';
import 'package:weather_app/modules/login/presentation/widgets/login_form.dart';
import 'package:weather_app/modules/register/presentation/widgets/continue_options.dart';
import 'package:weather_app/utils/components/app_typography.dart';
import 'package:weather_app/utils/components/ui_helpers.dart';

class LoginTabletView extends StatefulWidget {
  const LoginTabletView({super.key});

  @override
  State<LoginTabletView> createState() => _LoginTabletViewState();
}

class _LoginTabletViewState extends State<LoginTabletView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
          child: Center(
            child: Container(
              width: width < 1024 ? width * 0.8 : 800,
              height: height * 0.8,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
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
                        style: AppTypography.text36BlueBold,
                        textAlign: TextAlign.center,
                      ),
                      UIHelpers.verticalSpaceMedium,
                      Text(
                        'Welcome to Accurate\nWeather Insights',
                        style: AppTypography.text20BlackBold,
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
                          style: AppTypography.text20Black,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      UIHelpers.verticalSpaceExtraHuge,
                      Text(
                        'or continue with',
                        style: AppTypography.text20Blue,
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
        ),
      ),
    );
  }
}
