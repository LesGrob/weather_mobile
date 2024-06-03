import 'weather_applocalizations.dart';

/// The translations for English (`en`).
class WeatherAppLocalizationsEn extends WeatherAppLocalizations {
  WeatherAppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get initErrorTitle => 'Something went wrong!\nPlease try again later.';

  @override
  String get weatherScreenTitle => 'Weather';

  @override
  String get weatherScreenSearchLabel => 'Select City';

  @override
  String get weatherScreenEmptyTitle => 'Select city to display weather.';

  @override
  String get weatherScreenLoadingTitle => 'Weather data is loading.';

  @override
  String get weatherScreenNoData => 'No weather for current city.';

  @override
  String tempBlockText(num temp) {
    return '$temp °C';
  }

  @override
  String fellsLikeBlockText(num temp) {
    return 'Fells like: $temp °C';
  }

  @override
  String minTempBlockText(num temp) {
    return 'Min temp: $temp °C';
  }

  @override
  String maxTempBlockText(num temp) {
    return 'Max temp: $temp °C';
  }

  @override
  String windSpeedBlockText(num speed) {
    return 'Wind speed: $speed m/s';
  }

  @override
  String pressureBlockText(num pressure) {
    return 'Pressure: $pressure hPa';
  }

  @override
  String humidityBlockText(num humidity) {
    return 'Humidity: $humidity %';
  }

  @override
  String visibilityBlockText(num visibility) {
    return 'Visibility: $visibility m';
  }
}
