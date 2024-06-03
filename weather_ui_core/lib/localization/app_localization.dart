part of '/weather_ui_core.dart';

class AppLocalization {
  static WeatherAppLocalizations of(BuildContext? context) => context == null
      ? WeatherAppLocalizationsEn()
      : WeatherAppLocalizations.of(context) ?? WeatherAppLocalizationsEn();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      WeatherAppLocalizations.localizationsDelegates;

  static const List<Locale> supportedLocales =
      WeatherAppLocalizations.supportedLocales;
}
