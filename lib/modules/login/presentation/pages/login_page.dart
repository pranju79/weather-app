import 'package:flutter/material.dart';
import 'package:weather_app/modules/login/presentation/views/login_desktop_view.dart';
import 'package:weather_app/modules/login/presentation/views/login_mobile_view.dart';
import 'package:weather_app/modules/login/presentation/views/login_tablet_view.dart';
import 'package:weather_app/responsive.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: LoginMobileView(),
        tablet: LoginTabletView(),
        desktop: LoginDesktopView(),
      ),
    );
  }
}
