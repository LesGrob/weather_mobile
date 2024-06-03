part of '/weather_http.dart';

abstract class ApiResponse {
  ApiResponse();

  // ignore: avoid_unused_constructor_parameters
  ApiResponse.fromJson(Map<String, dynamic> json);
}
