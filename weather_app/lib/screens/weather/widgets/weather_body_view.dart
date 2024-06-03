import 'package:flutter/material.dart';
import 'package:weather_app/models/index.dart';
import 'package:weather_ui_core/weather_ui_core.dart';

class WeatherBodyView extends StatelessWidget {
  final Location city;
  final Weather weather;

  const WeatherBodyView({
    super.key,
    required this.weather,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context);
    final theme = AppTheme.of(context);
    return ListView(
      physics: const ClampingScrollPhysics(parent: BouncingScrollPhysics()),
      children: [
        Text(
          "${weather.city}, ${weather.countryCode}",
          style: TextStyle(
            color: theme.colorScheme.text,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          localization.tempBlockText(weather.temp.ceil()),
          style: TextStyle(
            color: theme.colorScheme.text,
            fontSize: 34,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          localization.fellsLikeBlockText(weather.feelsLike.ceil()) +
              weather.weatherConditions
                  .map((e) => '\n${e.description}')
                  .join(''),
          style: TextStyle(
            color: theme.colorScheme.textLight,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        _DataBlock(dataCells: [
          _DataCellItem(
            text: localization.minTempBlockText(weather.tempMin),
          ),
          _DataCellItem(
            text: localization.maxTempBlockText(weather.tempMax),
          ),
        ]),
        const SizedBox(height: 8),
        _DataBlock(dataCells: [
          _DataCellItem(
            text: localization.windSpeedBlockText(weather.windSpeed),
          ),
          _DataCellItem(
            text: localization.pressureBlockText(weather.pressure),
          ),
        ]),
        const SizedBox(height: 8),
        _DataBlock(dataCells: [
          _DataCellItem(
            text: localization.humidityBlockText(weather.humidity),
          ),
          _DataCellItem(
            text: localization.visibilityBlockText(weather.visibility),
          ),
        ]),
      ],
    );
  }
}

class _DataBlock extends StatelessWidget {
  final List<Widget> dataCells;
  const _DataBlock({required this.dataCells});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 2,
            color: theme.colorScheme.primary,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: dataCells,
        ),
      ),
    );
  }
}

class _DataCellItem extends StatelessWidget {
  final String text;
  const _DataCellItem({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      child: Text(
        text,
        style: TextStyle(
          color: theme.colorScheme.text,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
