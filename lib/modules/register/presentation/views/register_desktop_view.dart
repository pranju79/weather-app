import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/register/presentation/bloc/register_bloc.dart';
import 'package:weather_app/modules/register/presentation/widgets/continue_options.dart';
import 'package:weather_app/modules/register/presentation/widgets/register_form.dart';
import 'package:weather_app/utils/components/app_typography.dart';
import 'package:weather_app/utils/components/ui_helpers.dart';

class RegisterDesktopView extends StatefulWidget {
  const RegisterDesktopView({super.key});

  @override
  State<RegisterDesktopView> createState() => _RegisterDesktopViewState();
}

class _RegisterDesktopViewState extends State<RegisterDesktopView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Center(
                child: Container(
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
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/signup.jpg',
                                width: 460,
                                height: 460,
                              ),
                            ),
                          ],
                        ),
                      ),
                      UIHelpers.horizontalSpaceMedium,
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            UIHelpers.verticalSpaceSmall,
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
                            UIHelpers.verticalSpaceMedium,
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
                            UIHelpers.verticalSpaceLarge,
                            Text(
                              'or continue with',
                              style: AppTypography.text14Blue,
                              textAlign: TextAlign.center,
                            ),
                            UIHelpers.verticalSpaceSmall,
                            const ContinueOptions(),
                          ],
                        ),
                      ),
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
