part of '/weather_http.dart';

class WeatherResponse extends ApiResponse {
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

  final List<WeatherConditionResponse> weatherConditions;

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
  final double seaLevel;

  /// Atmospheric pressure on the ground level, hPa
  final double grndLevel;

  /// Visibility, meter. The maximum value of the visibility is 10 km
  final int visibility;

  /// Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
  final double windSpeed;

  /// Wind direction, degrees (meteorological)
  final double windDeg;

  /// Wind gust. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
  final double windGust;

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

  const WeatherResponse({
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

  WeatherResponse.fromJson(super.json)
      : dt = json["dt"],
        latitude = (json["coord"] as Map)["lat"],
        longitude = (json["coord"] as Map)["lon"],
        countryCode = (json["sys"] as Map)["country"],
        city = json["name"],
        timeZone = json["timezone"],
        sunrise = (json["sys"] as Map)["sunrise"],
        sunset = (json["sys"] as Map)["sunset"],
        weatherConditions = (json["weather"] as List)
            .map((e) => WeatherConditionResponse.fromJson(e))
            .toList(),
        temp = ((json["main"] as Map)["temp"] as num).toDouble(),
        feelsLike = ((json["main"] as Map)["feels_like"] as num).toDouble(),
        tempMin = ((json["main"] as Map)["temp_min"] as num).toDouble(),
        tempMax = ((json["main"] as Map)["temp_max"] as num).toDouble(),
        pressure = ((json["main"] as Map)["pressure"] as num).toDouble(),
        humidity = ((json["main"] as Map)["humidity"] as num).toDouble(),
        seaLevel = ((json["main"] as Map)["sea_level"] as num).toDouble(),
        grndLevel = ((json["main"] as Map)["grnd_level"] as num).toDouble(),
        visibility = json["visibility"] as int,
        windSpeed = ((json["wind"] as Map)["speed"] as num).toDouble(),
        windDeg = ((json["wind"] as Map)["deg"] as num).toDouble(),
        windGust = ((json["wind"] as Map)["gust"] as num).toDouble(),
        clouds = ((json["clouds"] as Map)["all"] as num).toDouble(),
        rain1h = ((json["rain"] as Map?)?["1h"] as num?)?.toDouble(),
        rain3h = ((json["rain"] as Map?)?["3h"] as num?)?.toDouble(),
        snow1h = ((json["snow"] as Map?)?["1h"] as num?)?.toDouble(),
        snow3h = ((json["snow"] as Map?)?["3h"] as num?)?.toDouble(),
        super.fromJson();
}
