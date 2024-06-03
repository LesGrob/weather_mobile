part of '/weather_http.dart';

class LocationApiResponse extends ApiResponse {
  final String type;
  final String subType;

  final String cityName;
  final String iataCode;
  final String? countryCode;

  final double latitude;
  final double longitude;

  LocationApiResponse({
    required this.type,
    required this.subType,
    required this.cityName,
    required this.iataCode,
    required this.countryCode,
    required this.latitude,
    required this.longitude,
  });

  LocationApiResponse.fromJson(super.json)
      : type = json["type"],
        subType = json["subType"],
        cityName = json["name"],
        iataCode = json["iataCode"],
        countryCode = (json["address"] as Map?)?["CountryCode"],
        latitude = double.parse((json["geoCode"] as Map)["latitude"]),
        longitude = double.parse((json["geoCode"] as Map)["longitude"]),
        super.fromJson();
}
