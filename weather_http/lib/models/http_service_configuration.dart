part of '/weather_http.dart';

class HttpServiceConfiguration {
  final EnvironmentType environmentType;

  final URLProtocol urlProtocol;
  final String serverUrl;
  final String serverApiUrl;

  const HttpServiceConfiguration({
    required this.environmentType,
    required this.urlProtocol,
    required this.serverUrl,
    required this.serverApiUrl,
  });

  Uri createServerUri(
    String unencodedPath, {
    Map<String, dynamic>? queryParameters,
  }) {
    switch (urlProtocol) {
      case URLProtocol.http:
        return Uri.http(
          serverUrl,
          "$serverApiUrl$unencodedPath",
          queryParameters,
        );
      case URLProtocol.https:
        return Uri.https(
          serverUrl,
          "$serverApiUrl$unencodedPath",
          queryParameters,
        );
    }
  }
}
