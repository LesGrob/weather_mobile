part of '/weather_http.dart';

class WeatherApiServiceMock extends WeatherApiServiceBase {
  const WeatherApiServiceMock(super.httpClient, super.configuration);

  @override
  Future<ThrowableResponse<WeatherResponse>> getWeather({
    required double latitude,
    required double longitude,
    required String language,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return ThrowableResponse.success(
      WeatherResponse(
        dt: 1661870592,
        latitude: latitude,
        longitude: longitude,
        countryCode: "IT",
        city: "Zocca",
        timeZone: 7200,
        sunrise: 1661834187,
        sunset: 1661882248,
        weatherConditions: [
          const WeatherConditionResponse(
            id: 501,
            type: "Rain",
            description: "moderate rain",
          ),
        ],
        temp: 298.48,
        feelsLike: 298.74,
        tempMin: 297.56,
        tempMax: 300.05,
        pressure: 1015,
        humidity: 64,
        seaLevel: 1015,
        grndLevel: 933,
        visibility: 10000,
        windSpeed: 0.62,
        windDeg: 349,
        windGust: 1.18,
        clouds: 100,
        rain1h: 3.16,
        rain3h: null,
        snow1h: null,
        snow3h: null,
      ),
    );
  }
}
