part of '/weather_http.dart';

class NetworkException extends AppException {
  const NetworkException(super.message);

  /// Return error from system exception
  static AppException fromException(Object e, StackTrace stackTrace) {
    if (e is SocketException) {
      return const NetworkException("No internet connection");
    } else if (e is TimeoutException) {
      return NetworkException("TimeoutException after ${e.duration}");
    } else if (e is FormatException) {
      return AppFormatException(e.message);
    } else if (e is ClientException) {
      return AppException(e.message, stackTrace);
    } else {
      return AppException.fromException(e, stackTrace);
    }
  }

  /// Parsing a response error from the server
  static AppException? fromResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return null;
      default:
        break;
    }

    String message = "";
    try {
      if (response.bodyBytes.isNotEmpty) {
        final decodedResponse = jsonDecode(
          utf8.decode(response.bodyBytes),
        ) as Map;

        if (decodedResponse.containsKey("errors") &&
            decodedResponse["errors"] is List) {
          for (var error in decodedResponse["errors"]) {
            if (error is Map) {
              message +=
                  "Status: ${error['status']}\nCode: ${error['code']}\nTitle: ${error['title']}\nDetail: ${error['detail']}";
            }
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    switch (response.statusCode) {
      case 401:
      case 403:
        return NetworkUnauthorizedException(
          response.request?.url.toString() ?? "undefined url",
          serverCode: response.statusCode,
          message: message,
        );
      case 404:
        return NetworkNotFoundException(
          response.request?.url.toString() ?? "not found",
          serverCode: response.statusCode,
          message: message,
        );
      case 429:
        return NetworkTooManyRequestsException(
          response.request?.url.toString() ?? "undefined url",
          serverCode: response.statusCode,
        );
      default:
        break;
    }

    if (message.isEmpty) {
      message = "Unhandled.";
    }
    return NetworkServerException(
      response.request?.url.toString() ?? "undefined url",
      response.statusCode,
      message,
    );
  }
}

class NetworkServerException extends AppException {
  final String url;
  final int? serverCode;

  const NetworkServerException(this.url, this.serverCode, String message)
      : super(message);

  @override
  String toString() =>
      "Server exception:\nURL: $url\nServer Code: $serverCode\nMessage: $message";
}

class NetworkNotFoundException extends NetworkServerException {
  const NetworkNotFoundException(String url, {int? serverCode, String? message})
      : super(url, serverCode ?? 404, message ?? "Not found");

  @override
  String toString() =>
      "Not found exception:\nURL: $url\nServer Code: $serverCode\nMessage:$message";
}

class NetworkUnauthorizedException extends NetworkServerException {
  const NetworkUnauthorizedException(String url,
      {int? serverCode, String? message})
      : super(url, serverCode ?? 103, message ?? "Unauthorized");

  @override
  String toString() =>
      "Unauthorized exception:\nURL: $url\nServer Code: $serverCode\nMessage:$message";
}

class NetworkTooManyRequestsException extends NetworkServerException {
  const NetworkTooManyRequestsException(
    String url, {
    required int serverCode,
    String message = 'Too many requests',
  }) : super(url, serverCode, message);

  @override
  String toString() =>
      "Too many requests exception:\nURL: $url\nServer Code: $serverCode\nMessage:$message";
}
