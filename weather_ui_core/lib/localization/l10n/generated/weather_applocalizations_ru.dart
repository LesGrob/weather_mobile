import 'weather_applocalizations.dart';

/// The translations for Russian (`ru`).
class WeatherAppLocalizationsRu extends WeatherAppLocalizations {
  WeatherAppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get initErrorTitle => 'Что-то пошло не так!\nПовторите попытку позже.';

  @override
  String get weatherScreenTitle => 'Погода';

  @override
  String get weatherScreenSearchLabel => 'Выберите город';

  @override
  String get weatherScreenEmptyTitle => 'Выберите город, чтобы отобразить данные';

  @override
  String get weatherScreenLoadingTitle => 'Данные о погоде загружаются.';

  @override
  String get weatherScreenNoData => 'Нет данным о погоде в выбранном городе.';

  @override
  String tempBlockText(num temp) {
    return '$temp °C';
  }

  @override
  String fellsLikeBlockText(num temp) {
    return 'Ощущается как: $temp °C';
  }

  @override
  String minTempBlockText(num temp) {
    return 'Мин температура: $temp °C';
  }

  @override
  String maxTempBlockText(num temp) {
    return 'Макс температура: $temp °C';
  }

  @override
  String windSpeedBlockText(num speed) {
    return 'Скорость ветра: $speed m/s';
  }

  @override
  String pressureBlockText(num pressure) {
    return 'Давление: $pressure hPa';
  }

  @override
  String humidityBlockText(num humidity) {
    return 'Влажность: $humidity %';
  }

  @override
  String visibilityBlockText(num visibility) {
    return 'Видимость: $visibility м';
  }
}
