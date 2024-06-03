import 'package:weather_app/models/index.dart';
import 'package:weather_http/weather_http.dart';

class Weather {
  /// Time of data calculation, unix, UTC
  final int dt;

  final double latitude;
  final double longitude;
  final String countryCode;
  final String city;

  /// Shift in seconds from UTC
  final int timeZone;

  /// Sunrise time, unix, UTC
  final int sunrise;

  /// Sunset time, unix, UTC
  final int sunset;

  final List<WeatherCondition> weatherConditions;

  /// Temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit
  final double temp;

  /// Temperature. This temperature parameter accounts for the human perception of weather. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit
  final double feelsLike;
  final double tempMin;
  final double tempMax;

  /// Atmospheric pressure on the sea level, hPa
  final double pressure;

  /// Humidity, %
  final double humidity;

  /// Atmospheric pressure on the sea level, hPa
  final double? seaLevel;

  /// Atmospheric pressure on the ground level, hPa
  final double? grndLevel;

  /// Visibility, meter. The maximum value of the visibility is 10 km
  final int visibility;

  /// Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
  final double windSpeed;

  /// Wind direction, degrees (meteorological)
  final double windDeg;

  /// Wind gust. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
  final double? windGust;

  /// Cloudiness, %
  final double clouds;

  /// Rain volume for the last 1 hour, mm
  final double? rain1h;

  /// Rain volume for the last 3 hours, mm
  final double? rain3h;

  ///Snow volume for the last 1 hour, mm
  final double? snow1h;

  /// Snow volume for the last 3 hours, mm
  final double? snow3h;

  const Weather({
    required this.dt,
    required this.latitude,
    required this.longitude,
    required this.countryCode,
    required this.city,
    required this.timeZone,
    required this.sunrise,
    required this.sunset,
    required this.weatherConditions,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.clouds,
    required this.rain1h,
    required this.rain3h,
    required this.snow1h,
    required this.snow3h,
  });

  Weather.fromApiModel(WeatherResponse apiModel)
      : dt = apiModel.dt,
        latitude = apiModel.latitude,
        longitude = apiModel.longitude,
        countryCode = apiModel.countryCode,
        city = apiModel.city,
        timeZone = apiModel.timeZone,
        sunrise = apiModel.sunrise,
        sunset = apiModel.sunset,
        weatherConditions = apiModel.weatherConditions
            .map((e) => WeatherCondition.fromApiModel(e))
            .toList(),
        temp = apiModel.temp,
        feelsLike = apiModel.feelsLike,
        tempMin = apiModel.tempMin,
        tempMax = apiModel.tempMax,
        pressure = apiModel.pressure,
        humidity = apiModel.humidity,
        seaLevel = apiModel.seaLevel,
        grndLevel = apiModel.grndLevel,
        visibility = apiModel.visibility,
        windSpeed = apiModel.windSpeed,
        windDeg = apiModel.windDeg,
        windGust = apiModel.windGust,
        clouds = apiModel.clouds,
        rain1h = apiModel.rain1h,
        rain3h = apiModel.rain3h,
        snow1h = apiModel.snow1h,
        snow3h = apiModel.snow3h;
}
