part of '/weather_http.dart';

abstract class HttpProviderBase {
  final WeatherApiServiceBase weather;
  final LocationApiServiceBase address;

  HttpProviderBase({
    required this.weather,
    required this.address,
  });

  HttpProviderBase.fromConfig({
    required Client httpClient,
    required WeatherHttpServiceConfiguration weatherApiConfig,
    required HttpServiceConfiguration locationApiConfig,
  }) : this(
          weather: WeatherApiService(httpClient, weatherApiConfig),
          address: LocationApiService(httpClient, locationApiConfig),
        );

  HttpProviderBase.mockFromConfig({
    required MockClient httpClient,
    required WeatherHttpServiceConfiguration weatherApiConfig,
    required HttpServiceConfiguration locationApiConfig,
  }) : this(
          weather: WeatherApiService(httpClient, weatherApiConfig),
          address: LocationApiServiceMock(httpClient, locationApiConfig),
        );
}
