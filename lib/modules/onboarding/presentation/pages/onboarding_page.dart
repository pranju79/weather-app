import 'package:flutter/material.dart';
import 'package:weather_app/modules/onboarding/presentation/views/onboarding_desktop_view.dart';
import 'package:weather_app/modules/onboarding/presentation/views/onboarding_mobile_view.dart';
import 'package:weather_app/modules/onboarding/presentation/views/onboarding_tablet_view.dart';
import 'package:weather_app/responsive.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: OnboardingMobileView(),
        tablet: OnboardingTabletView(),
        desktop: OnboardingDesktopView(),
      ),
    );
  }
}
