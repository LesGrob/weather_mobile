import 'dart:developer' as developer;

import 'package:weather_core/weather_core.dart';

class AppReportService {
  void logException(Object throwable, [StackTrace? stackTrace]) {
    final name = throwable.runtimeType;
    final message = throwable.toString();
    final StackTrace? sTrace =
        stackTrace ?? (throwable as AppException?)?.stackTrace;

    developer.log(
      message,
      name: name.toString(),
      error: throwable,
      stackTrace: sTrace,
    );
  }

  void logInfo(
    String name,
    String message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    developer.log(
      message,
      name: name.toString(),
      error: error,
      stackTrace: stackTrace,
    );
  }
}
