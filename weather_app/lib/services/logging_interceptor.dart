import 'package:http_interceptor/http_interceptor.dart';
import 'package:weather_app/services/index.dart';

class LoggingInterceptor extends InterceptorContract {
  final AppReportService reportService;

  LoggingInterceptor({required this.reportService});

  @override
  Future<BaseRequest> interceptRequest({
    required BaseRequest request,
  }) async {
    reportService.logInfo(
      'Server Request',
      request.toString(),
    );
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    reportService.logInfo(
      'Server Response',
      response.toString(),
    );
    return response;
  }
}
