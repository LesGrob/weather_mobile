part of '/weather_http.dart';

class LocationSearchApiResponse extends ApiResponse {
  final List<LocationApiResponse> addresses;

  LocationSearchApiResponse({required this.addresses});

  LocationSearchApiResponse.fromJson(super.json)
      : addresses = (json["data"] as List)
            .map((e) => LocationApiResponse.fromJson(e))
            .toList(),
        super.fromJson();
}
