import 'package:weather_app/services/index.dart';
import 'package:weather_http/weather_http.dart';
import 'package:weather_ui_core/weather_ui_core.dart';

import 'weather_store.dart';

class WeatherPresenter extends VPDPresenter<WeatherStore> {
  WeatherPresenter({
    required HttpProviderBase httpProvider,
    required AppReportService reportService,
  }) : super(
          dataStore: WeatherStore(
            httpProvider: httpProvider,
            reportService: reportService,
          ),
        );
}
