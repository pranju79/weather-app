import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/register/presentation/bloc/register_bloc.dart';
import 'package:weather_app/modules/register/presentation/widgets/continue_options.dart';
import 'package:weather_app/modules/register/presentation/widgets/register_form.dart';
import 'package:weather_app/utils/components/app_typography.dart';
import 'package:weather_app/utils/components/ui_helpers.dart';

class RegisterTabletView extends StatefulWidget {
  const RegisterTabletView({super.key});

  @override
  State<RegisterTabletView> createState() => _RegisterTabletViewState();
}

class _RegisterTabletViewState extends State<RegisterTabletView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (_) => RegisterBloc(),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UIHelpers.verticalSpaceHuge,
                    Text(
                      'Create Account',
                      style: AppTypography.text36BlueBold,
                      textAlign: TextAlign.center,
                    ),
                    UIHelpers.verticalSpaceRegular,
                    Text(
                      'Sign up to check the weather in your area!',
                      style: AppTypography.text20BlackBold,
                      textAlign: TextAlign.center,
                    ),
                    UIHelpers.verticalSpaceExtraHuge,
                    RegisterForm(
                      emailController: emailController,
                      passController: passController,
                      confirmPassController: confirmPassController,
                    ),
                    UIHelpers.verticalSpaceLarge,
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'Already have an account?',
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
    );
  }
}
