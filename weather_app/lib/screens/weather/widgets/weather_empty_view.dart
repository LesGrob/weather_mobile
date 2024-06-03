import 'package:flutter/widgets.dart';
import 'package:weather_ui_core/weather_ui_core.dart';

class WeatherEmptyView extends StatelessWidget {
  const WeatherEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context);
    final theme = AppTheme.of(context);
    return Center(
      child: Text(
        localization.weatherScreenEmptyTitle,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: theme.colorScheme.text,
          fontSize: 35,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
