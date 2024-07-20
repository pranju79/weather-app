import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/dashboard/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/modules/dashboard/presentation/widgets/weather_view.dart';
import 'package:weather_app/utils/components/app_colors.dart';
import 'package:weather_app/utils/components/app_icons.dart';
import 'package:weather_app/utils/components/app_typography.dart';

class DashboardDesktopView extends StatelessWidget {
  const DashboardDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Weather'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        centerTitle: true,
        titleTextStyle: AppTypography.text22White,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            icon: const Icon(AppIcons.logout)),
      ),
      body: BlocProvider(
        create: (context) => WeatherBloc(),
        child: const WeatherView(),
      ),
    );
  }
}
