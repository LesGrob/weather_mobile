import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:weather_app/screens/index.dart';
import 'package:weather_app/services/index.dart';
import 'package:weather_core/weather_core.dart';
import 'package:weather_ui_core/weather_ui_core.dart';

class AppRunnerService extends AppRunnerServiceBase {
  @override
  Future<Object?> afterRun() async {
    try {
      await Future.wait([
        // Delay to show splash
        Future.delayed(SplashScreen.animationDuration * 2),
      ]);
      return null;
    } catch (e, stackTrace) {
      return AppException.fromException(e, stackTrace);
    }
  }

  @override
  Future<void> beforeRun() async {
    await AppInjectionProvider.setupInjection();
  }

  @override
  Widget buildAppWidget() => MyApp(
        themeProvider: AppInjectionProvider.themeProvider,
        httpProvider: AppInjectionProvider.httpProvider,
        reportService: AppInjectionProvider.reportService,
      );

  @override
  Widget buildErrorWidget() => InitErrorScreen(
        themeProvider: AppInjectionProvider.themeProvider,
        appRunnerService: this,
      );

  @override
  Widget buildSplashWidget() => SplashScreen(
        themeProvider: AppInjectionProvider.themeProvider,
      );
}
