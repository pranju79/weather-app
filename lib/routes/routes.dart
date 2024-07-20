import 'package:flutter/material.dart';
import 'package:weather_app/modules/dashboard/presentation/pages/dashboard_page.dart';
import 'package:weather_app/modules/login/presentation/pages/login_page.dart';
import 'package:weather_app/modules/onboarding/presentation/pages/onboarding_page.dart';
import 'package:weather_app/modules/register/presentation/pages/register_page.dart';

// A class to manage application routes and navigation.
class AppRoutes {
  static const String onboarding = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      onboarding: (context) => const OnboardingPage(),
      login: (context) => const LoginPage(),
      register: (context) => const RegisterPage(),
      dashboard: (context) => const DashboardPage(),
    };
  }
}
