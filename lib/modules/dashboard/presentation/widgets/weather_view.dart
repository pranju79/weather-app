import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/dashboard/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/modules/dashboard/presentation/widgets/weather_details.dart';
import 'package:weather_app/utils/components/app_colors.dart';
import 'package:weather_app/utils/components/app_typography.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc()..add(FetchWeather()),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return Center(
              child: Text(
                'Please Wait...',
                style: AppTypography.text20BlueBold,
              ),
            );
          } else if (state is WeatherLoading) {
            return const SpinKitFadingCircle(
              color: AppColors.primary,
              size: 60,
            );
          } else if (state is WeatherLoaded) {
            return WeatherDetail(weather: state.weather);
          } else if (state is WeatherError) {
            return Center(
                child: Text(state.message,
                    style: const TextStyle(color: AppColors.red)));
          } else {
            return const Center(
                child: Text('Unknown state',
                    style: TextStyle(color: AppColors.red)));
          }
        },
      ),
    );
  }
}
