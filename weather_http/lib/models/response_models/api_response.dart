part of '/weather_http.dart';

abstract class ApiResponse {
  const ApiResponse();

  // ignore: avoid_unused_constructor_parameters
  const ApiResponse.fromJson(Map<String, dynamic> json);
}
