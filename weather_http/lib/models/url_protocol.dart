part of '/weather_http.dart';

enum URLProtocol {
  http,
  https;

  String toUrlString() {
    return "${toString().split('.').last}://";
  }
}
