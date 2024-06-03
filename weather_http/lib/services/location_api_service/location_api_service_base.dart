part of '/weather_http.dart';

abstract class LocationApiServiceBase extends HttpService {
  const LocationApiServiceBase(super.httpClient, super.configuration);

  Future<ThrowableResponse<LocationSearchApiResponse>> searchAddress(
    String searchText, {
    int max = 10,
  });
}
