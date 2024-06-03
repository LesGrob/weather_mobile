import 'package:weather_http/weather_http.dart';

class WeatherCondition {
  final int id;
  final String type;
  final String description;

  const WeatherCondition({
    required this.id,
    required this.type,
    required this.description,
  });

  WeatherCondition.fromApiModel(WeatherConditionResponse apiModel)
      : id = apiModel.id,
        type = apiModel.type,
        description = apiModel.description;
}
