import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_app/models/index.dart';
import 'package:weather_app/screens/weather/widgets/index.dart';
import 'package:weather_app/services/index.dart';
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
    final localization = AppLocalization.of(context);

    return BaseScaffold(
      appBar: BaseAppBar(
        title: localization.weatherScreenTitle,
        bottom: PreferredSize(
          preferredSize: CustomDropdownMenu.minSize,
          child: Observer(
            builder: (context) => CustomDropdownMenu<Location>(
              controller: presenter.searchController,
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              label: localization.weatherScreenSearchLabel,
              onSelected: presenter.onLocationSelect,
              dropdownMenuEntries: dataStore.cities
                  .map<DropdownMenuEntry<Location>>(
                    (city) => DropdownMenuEntry(
                      value: city,
                      label: city.countryCode == null
                          ? city.cityName
                          : "${city.cityName}, ${city.countryCode}",
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Observer(builder: (context) {
          if (dataStore.selectedCity == null) {
            return WeatherEmptyView();
          }
          if (dataStore.weather == null ||
              dataStore.isWeatherLoading ||
              dataStore.hasLoadingError) {
            return WeatherLoadingView(
              city: dataStore.selectedCity!,
              isWeatherLoading: dataStore.isWeatherLoading,
            );
          }
          return WeatherBodyView(
            city: dataStore.selectedCity!,
            weather: dataStore.weather!,
          );
        }),
      ),
    );
  }
}
