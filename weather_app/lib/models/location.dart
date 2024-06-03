import 'package:weather_http/weather_http.dart';

class Location {
  final String type;
  final String subType;

  final String cityName;
  final String? iataCode;
  final String? countryCode;

  final double latitude;
  final double longitude;

  const Location({
    required this.type,
    required this.subType,
    required this.cityName,
    required this.iataCode,
    required this.countryCode,
    required this.latitude,
    required this.longitude,
  });

  Location.fromApiModel(LocationApiResponse apiModel)
      : type = apiModel.type,
        subType = apiModel.subType,
        cityName = apiModel.cityName,
        iataCode = apiModel.iataCode,
        countryCode = apiModel.countryCode,
        latitude = apiModel.latitude,
        longitude = apiModel.longitude;

  @override
  bool operator ==(Object other) =>
      other is Location &&
      type == other.type &&
      subType == other.subType &&
      cityName == other.cityName &&
      iataCode == other.iataCode &&
      countryCode == other.countryCode &&
      latitude == other.latitude &&
      longitude == other.longitude;

  @override
  int get hashCode =>
      type.hashCode ^
      subType.hashCode ^
      cityName.hashCode ^
      iataCode.hashCode ^
      countryCode.hashCode ^
      latitude.hashCode ^
      longitude.hashCode;
}
