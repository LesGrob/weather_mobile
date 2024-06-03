part of '/weather_http.dart';

class LocationApiServiceMock extends LocationApiServiceBase {
  LocationApiServiceMock(super.httpClient, super.configuration);

  @override
  Future<ThrowableResponse<LocationSearchApiResponse>> searchAddress(
    String searchText, {
    int max = 10,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return ThrowableResponse.success(
      LocationSearchApiResponse(addresses: [
        LocationApiResponse(
          type: "location",
          subType: "city",
          cityName: "PARIS",
          iataCode: "PAR",
          countryCode: "FR",
          latitude: 49.01278,
          longitude: 2.55,
        ),
      ]),
    );
  }
}
