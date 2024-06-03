part of '/weather_http.dart';

class WeatherHttpServiceConfiguration extends HttpServiceConfiguration {
  final String apiKey;

  const WeatherHttpServiceConfiguration({
    required this.apiKey,
    required super.environmentType,
    required super.urlProtocol,
    required super.serverUrl,
    required super.serverApiUrl,
  });
}
