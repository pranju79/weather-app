import 'package:flutter/material.dart';
import 'package:weather_app/modules/dashboard/presentation/views/dashboard_desktop_view.dart';
import 'package:weather_app/modules/dashboard/presentation/views/dashboard_mobile_view.dart';
import 'package:weather_app/modules/dashboard/presentation/views/dashboard_tablet_view.dart';
import 'package:weather_app/responsive.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: DashboardMobileView(),
        tablet: DashboardTabletView(),
        desktop: DashboardDesktopView(),
      ),
    );
  }
}
