import 'package:http/testing.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:weather_app/directories/index.dart';
import 'package:weather_app/services/index.dart';
import 'package:weather_core/weather_core.dart';
import 'package:weather_http/weather_http.dart';

class AppHttpProvider extends HttpProviderBase {
  AppHttpProvider.production({
    required AppReportService reportService,
  }) : super.fromConfig(
          httpClient: InterceptedClient.build(
            interceptors: [
              LoggingInterceptor(reportService: reportService),
            ],
          ),
          weatherApiConfig: HttpServiceConfiguration(
            environmentType: EnvironmentType.mock,
            urlProtocol: URLProtocol.https,
            serverUrl: "api.openweathermap.org",
            serverApiUrl: "/data/2.5/",
            apiKey: AppConstants.weatherApiKey,
          ),
          locationApiConfig: HttpServiceConfiguration(
            environmentType: EnvironmentType.production,
            urlProtocol: URLProtocol.https,
            serverUrl: "test.api.amadeus.com",
            serverApiUrl: "/v1/",
            apiKey: AppConstants.locationApiKey,
          ),
        );

  AppHttpProvider.mock(MockClient httpClientMock)
      : super.mockFromConfig(
          httpClient: httpClientMock,
          weatherApiConfig: HttpServiceConfiguration(
            environmentType: EnvironmentType.mock,
            urlProtocol: URLProtocol.https,
            serverUrl: "api.openweathermap.org",
            serverApiUrl: "/data/2.5/",
            apiKey: "",
          ),
          locationApiConfig: HttpServiceConfiguration(
              environmentType: EnvironmentType.production,
              urlProtocol: URLProtocol.https,
              serverUrl: "test.api.amadeus.com",
              serverApiUrl: "/v1/",
              apiKey: ""),
        );
}
