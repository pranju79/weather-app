import 'package:flutter/material.dart';
import 'package:weather_app/modules/onboarding/presentation/widgets/login_register_button.dart';
import 'package:weather_app/utils/components/app_typography.dart';
import 'package:weather_app/utils/components/ui_helpers.dart';

class OnboardingMobileView extends StatelessWidget {
  const OnboardingMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Center(
                  child: Image.asset(
                    'assets/welcome_img.png',
                    width: 300,
                    height: 340,
                  ),
                ),
                UIHelpers.verticalSpaceMedium,
                Text(
                  'Welcome to Your\nWeather Companion',
                  style: AppTypography.text26BlueBold,
                  textAlign: TextAlign.center,
                ),
                UIHelpers.verticalSpaceSmall,
                Text(
                  'Accurate Weather Forecasts\nWherever You Are',
                  style: AppTypography.text14Black,
                  textAlign: TextAlign.center,
                ),
                UIHelpers.verticalSpaceHuge,
                const LoginRegisterButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
