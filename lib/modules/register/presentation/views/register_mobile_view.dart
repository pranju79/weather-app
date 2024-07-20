import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/register/presentation/bloc/register_bloc.dart';
import 'package:weather_app/modules/register/presentation/widgets/continue_options.dart';
import 'package:weather_app/modules/register/presentation/widgets/register_form.dart';
import 'package:weather_app/utils/components/app_typography.dart';
import 'package:weather_app/utils/components/ui_helpers.dart';

class RegisterMobileView extends StatefulWidget {
  const RegisterMobileView({super.key});

  @override
  State<RegisterMobileView> createState() => _RegisterMobileViewState();
}

class _RegisterMobileViewState extends State<RegisterMobileView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UIHelpers.verticalSpaceMedium,
                  Text(
                    'Create Account',
                    style: AppTypography.text26BlueBold,
                    textAlign: TextAlign.center,
                  ),
                  UIHelpers.verticalSpaceSmall,
                  Text(
                    'Sign up to check the weather in your area!',
                    style: AppTypography.text16BlackBold,
                    textAlign: TextAlign.center,
                  ),
                  UIHelpers.verticalSpaceHuge,
                  RegisterForm(
                    emailController: emailController,
                    passController: passController,
                    confirmPassController: confirmPassController,
                  ),
                  UIHelpers.verticalSpaceMedium,
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'Already have an account?',
                      style: AppTypography.text14Black,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  UIHelpers.verticalSpaceHuge,
                  Text(
                    'or continue with',
                    style: AppTypography.text14Blue,
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
