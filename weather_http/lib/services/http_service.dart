part of '/weather_http.dart';

abstract class HttpService {
  final Client httpClient;
  final HttpServiceConfiguration configuration;

  const HttpService(this.httpClient, this.configuration);

  Future<ThrowableResponse<T>> makeRequest<T>(
    T Function(dynamic json) serializer,
    String url, {
    Map<String, dynamic>? queryParameters,
    Object? body,
    Map<String, String>? headers,
    required RequestType requestType,
    bool withTimeout = true,
    bool longTimeout = false,
  }) async {
    final Uri uri = configuration.createServerUri(
      url,
      queryParameters: queryParameters,
    );
    final Map<String, String> requestHeaders = {
      "Accept": "application/json",
      "content-type": "application/json",
    };

    if (headers != null) {
      requestHeaders.addAll(headers);
    }

    try {
      final encodedBody = jsonEncode(body);

      Response response;
      switch (requestType) {
        case RequestType.get:
          response = await httpClient.get(uri, headers: requestHeaders);
          break;
        case RequestType.post:
          response = await httpClient.post(
            uri,
            headers: requestHeaders,
            body: encodedBody,
          );
          break;
        case RequestType.put:
          response = await httpClient.put(
            uri,
            headers: requestHeaders,
            body: encodedBody,
          );
          break;
        case RequestType.delete:
          response = await httpClient.delete(
            uri,
            headers: requestHeaders,
            body: encodedBody,
          );
          break;
        case RequestType.patch:
          response = await httpClient.patch(
            uri,
            headers: requestHeaders,
            body: encodedBody,
          );
          break;
      }
      final AppException? responseException = NetworkException.fromResponse(
        response,
      );

      if (responseException != null) {
        return ThrowableResponse.failure(responseException);
      }
      if (response.body.isEmpty) {
        return ThrowableResponse.success(serializer({}));
      }
      return ThrowableResponse.success(
        serializer(jsonDecode(response.body)),
      );
    } catch (e, stackTrace) {
      return ThrowableResponse.failure(
        AppException.fromException(e, stackTrace),
      );
    }
  }
}
