import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/index.dart';
import 'package:weather_app/services/index.dart';
import 'package:weather_http/weather_http.dart';
import 'package:weather_ui_core/weather_ui_core.dart';

class MyApp extends StatelessWidget {
  final AppTheme themeProvider;
  final HttpProviderBase httpProvider;
  final AppReportService reportService;

  const MyApp({
    super.key,
    required this.themeProvider,
    required this.httpProvider,
    required this.reportService,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppTheme>(
      create: (_) => themeProvider,
      child: Consumer<AppTheme>(
        builder: (context, AppTheme appTheme, child) {
          return MaterialApp(
            title: 'KeepStuff Partner',
            localizationsDelegates: AppLocalization.localizationsDelegates,
            supportedLocales: AppLocalization.supportedLocales,
            theme: appTheme.materialAppTheme,
            home: WeatherScreen(
              httpProvider: httpProvider,
              reportService: reportService,
            ),
          );
        },
      ),
    );
  }
}
