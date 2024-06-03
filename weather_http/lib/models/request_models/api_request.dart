part of '/weather_http.dart';

abstract class ApiRequest {
  Map<String, dynamic> toJson();
}
