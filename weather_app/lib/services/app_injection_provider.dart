import 'package:get_it/get_it.dart';
import 'package:weather_app/services/index.dart';
import 'package:weather_http/weather_http.dart';
import 'package:weather_ui_core/weather_ui_core.dart';

class AppInjectionProvider {
  // ///
  // Providers injections
  static HttpProviderBase get httpProvider => GetIt.I.get<HttpProviderBase>();

  // ///
  // Services injections
  static AppRunnerServiceBase get runner => GetIt.I.get<AppRunnerServiceBase>();
  static AppReportService get reportService => GetIt.I.get<AppReportService>();

  // ///
  // Data injections
  static AppTheme get themeProvider => GetIt.I.get<AppTheme>();

  // /////////////////////////////////////////
  // //// Methods ////////////////////////////
  // /////////////////////////////////////////

  /// Injects all services/stores/models of app
  static Future<void> setupInjection() async {
    /// Style utils injection
    final themeData = await AppTheme.getDataFromCache(
      defaultData: AppThemeData.light(),
    );
    GetIt.I.registerSingleton<AppTheme>(AppTheme(themeData));

    /// Services injection
    final reportService = AppReportService();
    GetIt.I.registerSingleton<AppReportService>(reportService);

    /// Providers injection
    // final httpProvider = AppHttpProvider.mock(
    //   MockClient((_) async => Response("body", 200)),
    // );
    final httpProvider = AppHttpProvider.production(
      reportService: reportService,
    );
    GetIt.I.registerSingleton<HttpProviderBase>(httpProvider);
  }
}
