import 'package:flutter/material.dart';
import 'package:weather_app/models/index.dart';
import 'package:weather_ui_core/weather_ui_core.dart';

class WeatherLoadingView extends StatelessWidget {
  final Location city;
  final bool isWeatherLoading;

  const WeatherLoadingView({
    super.key,
    required this.city,
    required this.isWeatherLoading,
  });

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context);
    final theme = AppTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          city.countryCode == null
              ? city.cityName
              : "${city.cityName}, ${city.countryCode}",
          style: TextStyle(
            color: theme.colorScheme.text,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8),
        if (isWeatherLoading)
          Row(children: [
            SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              localization.weatherScreenLoadingTitle,
              style: TextStyle(
                color: theme.colorScheme.textLight,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ]),
        if (!isWeatherLoading)
          Text(
            localization.weatherScreenNoData,
            style: TextStyle(
              color: theme.colorScheme.textLight,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}
