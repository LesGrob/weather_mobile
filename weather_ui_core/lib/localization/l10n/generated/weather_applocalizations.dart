import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'weather_applocalizations_en.dart';
import 'weather_applocalizations_ru.dart';

/// Callers can lookup localized strings with an instance of WeatherAppLocalizations
/// returned by `WeatherAppLocalizations.of(context)`.
///
/// Applications need to include `WeatherAppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/weather_applocalizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: WeatherAppLocalizations.localizationsDelegates,
///   supportedLocales: WeatherAppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the WeatherAppLocalizations.supportedLocales
/// property.
abstract class WeatherAppLocalizations {
  WeatherAppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static WeatherAppLocalizations? of(BuildContext context) {
    return Localizations.of<WeatherAppLocalizations>(context, WeatherAppLocalizations);
  }

  static const LocalizationsDelegate<WeatherAppLocalizations> delegate = _WeatherAppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @initErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong!\nPlease try again later.'**
  String get initErrorTitle;

  /// No description provided for @weatherScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get weatherScreenTitle;

  /// No description provided for @weatherScreenSearchLabel.
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get weatherScreenSearchLabel;

  /// No description provided for @weatherScreenEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Select city to display weather.'**
  String get weatherScreenEmptyTitle;

  /// No description provided for @weatherScreenLoadingTitle.
  ///
  /// In en, this message translates to:
  /// **'Weather data is loading.'**
  String get weatherScreenLoadingTitle;

  /// No description provided for @weatherScreenNoData.
  ///
  /// In en, this message translates to:
  /// **'No weather for current city.'**
  String get weatherScreenNoData;

  /// No description provided for @tempBlockText.
  ///
  /// In en, this message translates to:
  /// **'{temp} °C'**
  String tempBlockText(num temp);

  /// No description provided for @fellsLikeBlockText.
  ///
  /// In en, this message translates to:
  /// **'Fells like: {temp} °C'**
  String fellsLikeBlockText(num temp);

  /// No description provided for @minTempBlockText.
  ///
  /// In en, this message translates to:
  /// **'Min temp: {temp} °C'**
  String minTempBlockText(num temp);

  /// No description provided for @maxTempBlockText.
  ///
  /// In en, this message translates to:
  /// **'Max temp: {temp} °C'**
  String maxTempBlockText(num temp);

  /// No description provided for @windSpeedBlockText.
  ///
  /// In en, this message translates to:
  /// **'Wind speed: {speed} m/s'**
  String windSpeedBlockText(num speed);

  /// No description provided for @pressureBlockText.
  ///
  /// In en, this message translates to:
  /// **'Pressure: {pressure} hPa'**
  String pressureBlockText(num pressure);

  /// No description provided for @humidityBlockText.
  ///
  /// In en, this message translates to:
  /// **'Humidity: {humidity} %'**
  String humidityBlockText(num humidity);

  /// No description provided for @visibilityBlockText.
  ///
  /// In en, this message translates to:
  /// **'Visibility: {visibility} m'**
  String visibilityBlockText(num visibility);
}

class _WeatherAppLocalizationsDelegate extends LocalizationsDelegate<WeatherAppLocalizations> {
  const _WeatherAppLocalizationsDelegate();

  @override
  Future<WeatherAppLocalizations> load(Locale locale) {
    return SynchronousFuture<WeatherAppLocalizations>(lookupWeatherAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_WeatherAppLocalizationsDelegate old) => false;
}

WeatherAppLocalizations lookupWeatherAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return WeatherAppLocalizationsEn();
    case 'ru': return WeatherAppLocalizationsRu();
  }

  throw FlutterError(
    'WeatherAppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
