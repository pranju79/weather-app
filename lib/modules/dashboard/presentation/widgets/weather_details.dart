import 'package:flutter/material.dart';
import 'package:weather_app/utils/components/app_colors.dart';
import 'package:weather_app/utils/components/app_typography.dart';
import 'package:weather_app/utils/components/ui_helpers.dart';
import 'package:weather_app/utils/components/app_icons.dart';

class WeatherDetail extends StatelessWidget {
  final Map<String, dynamic> weather;

  const WeatherDetail({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Define sizes for mobile, tablet, and desktop
    double iconSize;
    TextStyle labelStyle;
    TextStyle valueStyle;
    int crossAxisCount = 2;

    if (screenWidth >= 1024) {
      iconSize = 100.0;
      labelStyle = AppTypography.text32BlackBold;
      valueStyle = AppTypography.text32BlackBold;
      crossAxisCount = 3;
    } else if (screenWidth >= 600) {
      iconSize = 86.0;
      labelStyle = AppTypography.text28BlackBold;
      valueStyle = AppTypography.text28BlackBold;
    } else {
      iconSize = 40.0;
      labelStyle = AppTypography.text14BlackBold;
      valueStyle = AppTypography.text14BlackBold;
    }

    List<Map<String, dynamic>> weatherItems = [
      {
        'icon': AppIcons.thermostat,
        'label': 'Temperature',
        'value': '${weather['main']['temp'].toStringAsFixed(1)} °C',
      },
      {
        'icon': AppIcons.waterdrop,
        'label': 'Humidity',
        'value': '${weather['main']['humidity']} %',
      },
      {
        'icon': AppIcons.air,
        'label': 'Wind Speed',
        'value': '${weather['wind']['speed']} m/s',
      },
      {
        'icon': AppIcons.visibility,
        'label': 'Visibility',
        'value': '${(weather['visibility'] / 1000).toStringAsFixed(1)} km',
      },
      {
        'icon': AppIcons.wbsunny,
        'label': 'Feels Like',
        'value': '${weather['main']['feels_like'].toStringAsFixed(1)} °C',
      },
      {
        'icon': AppIcons.cloud,
        'label': 'Cloudiness',
        'value': '${weather['clouds']['all']} %',
      },
    ];

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UIHelpers.verticalSpaceSmall,
            Text(
              '${weather['name']}',
              style: AppTypography.text45BlueBold,
            ),
            UIHelpers.verticalSpaceSmall,
            Text('${weather['weather'][0]['description']}',
                style: AppTypography.text24BlackBold),
            UIHelpers.verticalSpaceMedium,
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: weatherItems.length,
                itemBuilder: (context, index) {
                  final item = weatherItems[index];
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary, width: 2),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.lightblue,
                    ),
                    child: Center(
                      child: _weatherInfoItem(
                        icon: item['icon'],
                        label: item['label'],
                        value: item['value'],
                        iconSize: iconSize,
                        labelStyle: labelStyle,
                        valueStyle: valueStyle,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _weatherInfoItem({
    required IconData icon,
    required String label,
    required String value,
    required double iconSize,
    required TextStyle labelStyle,
    required TextStyle valueStyle,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: iconSize, color: AppColors.primary),
        UIHelpers.verticalSpaceMedium,
        Text(label, style: labelStyle),
        UIHelpers.verticalSpaceSmall,
        Text(value, style: valueStyle),
      ],
    );
  }
}
