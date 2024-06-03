part of '/weather_http.dart';

class LocationApiService extends LocationApiServiceBase {
  const LocationApiService(super.httpClient, super.configuration);

  @override
  Future<ThrowableResponse<LocationSearchApiResponse>> searchAddress(
    String searchText, {
    int max = 10,
  }) =>
      makeRequest(
        (json) => LocationSearchApiResponse.fromJson(json),
        "reference-data/locations/cities",
        requestType: RequestType.get,
        queryParameters: {
          "keyword": searchText,
          "max": max.toString(),
        },
        headers: {"Authorization": "Bearer ${configuration.apiKey}"},
      );
}
