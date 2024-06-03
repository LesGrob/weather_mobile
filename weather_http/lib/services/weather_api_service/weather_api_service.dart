part of '/weather_http.dart';

class WeatherApiService extends WeatherApiServiceBase {
  const WeatherApiService(super.httpClient, super.configuration);

  @override
  Future<ThrowableResponse<WeatherResponse>> getWeather({
    required double latitude,
    required double longitude,
    String? language,
  }) =>
      makeRequest(
        (json) => WeatherResponse.fromJson(json),
        "weather",
        requestType: RequestType.get,
        queryParameters: {
          "lat": latitude.toString(),
          "lon": longitude.toString(),
          if (language != null) "lang": language,
          "appid": configuration.apiKey,
          "units": "metric",
        },
      );
}
