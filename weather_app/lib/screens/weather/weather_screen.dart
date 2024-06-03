import 'package:flutter/material.dart';
import 'package:weather_app/services/app_report_service.dart';
import 'package:weather_http/weather_http.dart';
import 'package:weather_ui_core/weather_ui_core.dart';

import 'weather_store.dart';
import 'weather_presenter.dart';

class WeatherScreen extends StatefulWidget {
  final HttpProviderBase httpProvider;
  final AppReportService reportService;

  const WeatherScreen({
    super.key,
    required this.httpProvider,
    required this.reportService,
  });

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState
    extends VPDScreenState<WeatherScreen, WeatherPresenter> {
  WeatherStore get dataStore => presenter.dataStore;

  @override
  void initState() {
    presenter = WeatherPresenter(
      httpProvider: widget.httpProvider,
      reportService: widget.reportService,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO: implement build
    throw UnimplementedError();
  }
}
