part of '/weather_http.dart';

abstract class HttpProviderBase {
  final WeatherApiServiceBase weather;
  final LocationApiServiceBase location;

  HttpProviderBase({
    required this.weather,
    required this.location,
  });

  HttpProviderBase.fromConfig({
    required Client httpClient,
    required HttpServiceConfiguration weatherApiConfig,
    required HttpServiceConfiguration locationApiConfig,
  }) : this(
          weather: WeatherApiService(httpClient, weatherApiConfig),
          location: LocationApiService(httpClient, locationApiConfig),
        );

  HttpProviderBase.mockFromConfig({
    required MockClient httpClient,
    required HttpServiceConfiguration weatherApiConfig,
    required HttpServiceConfiguration locationApiConfig,
  }) : this(
          weather: WeatherApiService(httpClient, weatherApiConfig),
          location: LocationApiServiceMock(httpClient, locationApiConfig),
        );
}
