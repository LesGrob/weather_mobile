part of '/weather_http.dart';

abstract class HttpProviderBase {
  final LocationApiServiceBase address;

  HttpProviderBase({
    required this.address,
  });

  HttpProviderBase.fromConfig({
    required Client httpClient,
    required HttpServiceConfiguration weatherApiConfig,
    required HttpServiceConfiguration locationApiConfig,
  }) : this(
          address: LocationApiService(httpClient, locationApiConfig),
        );

  HttpProviderBase.mockFromConfig({
    required MockClient httpClient,
    required HttpServiceConfiguration weatherApiConfig,
    required HttpServiceConfiguration locationApiConfig,
  }) : this(
          address: LocationApiServiceMock(httpClient, locationApiConfig),
        );
}
