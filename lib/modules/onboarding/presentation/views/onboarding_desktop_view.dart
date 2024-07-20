import 'package:flutter/material.dart';
import 'package:weather_app/modules/onboarding/presentation/widgets/login_register_button.dart';
import 'package:weather_app/utils/components/app_typography.dart';
import 'package:weather_app/utils/components/ui_helpers.dart';

class OnboardingDesktopView extends StatelessWidget {
  const OnboardingDesktopView({super.key});

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
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/welcome_img.png',
                          width: 480,
                          height: 580,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Welcome to Your\nWeather Companion',
                        style: AppTypography.text45BlueBold,
                        textAlign: TextAlign.center,
                      ),
                      UIHelpers.verticalSpaceRegular,
                      Text(
                        'Accurate Weather Forecasts\nWherever You Are',
                        style: AppTypography.text24Black,
                        textAlign: TextAlign.center,
                      ),
                      UIHelpers.verticalSpaceExtraHuge,
                      const LoginRegisterButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
