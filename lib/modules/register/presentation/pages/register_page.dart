import 'package:flutter/material.dart';
import 'package:weather_app/modules/register/presentation/views/register_desktop_view.dart';
import 'package:weather_app/modules/register/presentation/views/register_mobile_view.dart';
import 'package:weather_app/modules/register/presentation/views/register_tablet_view.dart';
import 'package:weather_app/responsive.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: RegisterMobileView(),
        tablet: RegisterTabletView(),
        desktop: RegisterDesktopView(),
      ),
    );
  }
}
