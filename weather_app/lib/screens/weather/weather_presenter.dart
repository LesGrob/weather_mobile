import 'package:flutter/material.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/services/index.dart';
import 'package:weather_http/weather_http.dart';
import 'package:weather_ui_core/weather_ui_core.dart';

import 'weather_store.dart';

class WeatherPresenter extends VPDPresenter<WeatherStore> {
  final TextEditingController searchController = TextEditingController();

  WeatherPresenter({
    required HttpProviderBase httpProvider,
    required AppReportService reportService,
  }) : super(
          dataStore: WeatherStore(
            httpProvider: httpProvider,
            reportService: reportService,
          ),
        );

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() => dataStore.searchCities(searchController.text);

  void onLocationSelect(Location? location) {
    if (location == null) return;

    dataStore.fetchWeatherFor(
      location,
      language:
          view.mounted ? AppLocalization.of(view.context).localeName : null,
    );
  }
}
