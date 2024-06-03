import 'package:flutter/material.dart';
import 'package:weather_core/weather_core.dart';
import 'package:weather_ui_core/weather_ui_core.dart';

class InitErrorScreen extends StatelessWidget {
  final AppTheme themeProvider;
  final AppRunnerServiceBase appRunnerService;

  const InitErrorScreen({
    super.key,
    required this.themeProvider,
    required this.appRunnerService,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather app',
      localizationsDelegates: AppLocalization.localizationsDelegates,
      supportedLocales: AppLocalization.supportedLocales,
      theme: themeProvider.materialAppTheme,
      home: Builder(
        builder: (context) {
          final AppException? error =
              appRunnerService.initException.value as AppException?;
          return Scaffold(
            backgroundColor: themeProvider.colorScheme.background,
            body: Center(
              child: Text(
                error?.message ?? AppLocalization.of(context).initErrorTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black1,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
