part of '/weather_http.dart';

class LocationSearchApiResponse extends ApiResponse {
  final List<LocationApiResponse> addresses;

  const LocationSearchApiResponse({required this.addresses});

  LocationSearchApiResponse.fromJson(super.json)
      : addresses = (json["data"] as List?)
                ?.map((e) {
                  try {
                    return LocationApiResponse.fromJson(e);
                  } catch (_) {
                    return null;
                  }
                })
                .whereType<LocationApiResponse>()
                .toList() ??
            [],
        super.fromJson();
}
