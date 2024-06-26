part of '/weather_http.dart';

abstract class WeatherApiServiceBase extends HttpService {
  const WeatherApiServiceBase(super.httpClient, super.configuration);

  Future<ThrowableResponse<WeatherResponse>> getWeather({
    required double latitude,
    required double longitude,
    String? language,
  });
}
