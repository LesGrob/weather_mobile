import 'package:weather_app/models/index.dart';
import 'package:weather_app/services/index.dart';
import 'package:weather_core/weather_core.dart';
import 'package:weather_http/weather_http.dart';
import 'package:weather_ui_core/weather_ui_core.dart';
import 'package:mobx/mobx.dart';

part 'weather_store.g.dart';

class WeatherStore = _WeatherStore with _$WeatherStore;

abstract class _WeatherStore extends VPDDataStore with Store {
  final HttpProviderBase httpProvider;
  final AppReportService reportService;
  final Debouncer _citiesDebouncer = Debouncer();

  @readonly
  bool _isCitiesLoading = false;
  @readonly
  bool _isWeatherLoading = false;
  @readonly
  bool _hasLoadingError = false;

  @readonly
  List<Location> _cities = [];

  @readonly
  Weather? _weather;
  @readonly
  Location? _selectedCity;

  _WeatherStore({
    required this.httpProvider,
    required this.reportService,
  });

  void searchCities(String searchText) {
    _citiesDebouncer.run(() => _searchCities(searchText));
  }

  @action
  Future<void> _searchCities(String searchText) async {
    if (searchText.length < 4) {
      transaction(() {
        _cities = [];
        _isCitiesLoading = false;
      });
      return;
    }

    _isCitiesLoading = true;
    final result = await httpProvider.location.searchAddress(searchText);
    transaction(() {
      result.handle(
        onFailure: reportService.logException,
        onSuccess: (data) {
          _cities =
              data.addresses.map((e) => Location.fromApiModel(e)).toList();
        },
      );
      _isCitiesLoading = false;
    });
  }

  @action
  Future<void> fetchWeatherFor(
    Location location, {
    String? language,
  }) async {
    if (location == _selectedCity) return;

    transaction(() {
      _isWeatherLoading = true;
      _selectedCity = location;
    });
    final result = await httpProvider.weather.getWeather(
      latitude: location.latitude,
      longitude: location.longitude,
      language: language,
    );
    transaction(() {
      result.handle(
        onFailure: (error) {
          reportService.logException(error);
          _hasLoadingError = true;
        },
        onSuccess: (data) {
          _weather = Weather.fromApiModel(data);
          _hasLoadingError = false;
        },
      );
      _isWeatherLoading = false;
    });
  }
}
