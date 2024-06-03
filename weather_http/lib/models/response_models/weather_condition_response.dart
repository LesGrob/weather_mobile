part of '/weather_http.dart';

class WeatherConditionResponse extends ApiResponse {
  final int id;
  final String type;
  final String description;

  const WeatherConditionResponse({
    required this.id,
    required this.type,
    required this.description,
  });

  WeatherConditionResponse.fromJson(super.json)
      : id = json["id"],
        type = json["main"],
        description = json["description"],
        super.fromJson();
}
