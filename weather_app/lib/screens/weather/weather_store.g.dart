// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WeatherStore on _WeatherStore, Store {
  late final _$_isCitiesLoadingAtom =
      Atom(name: '_WeatherStore._isCitiesLoading', context: context);

  bool get isCitiesLoading {
    _$_isCitiesLoadingAtom.reportRead();
    return super._isCitiesLoading;
  }

  @override
  bool get _isCitiesLoading => isCitiesLoading;

  @override
  set _isCitiesLoading(bool value) {
    _$_isCitiesLoadingAtom.reportWrite(value, super._isCitiesLoading, () {
      super._isCitiesLoading = value;
    });
  }

  late final _$_isWeatherLoadingAtom =
      Atom(name: '_WeatherStore._isWeatherLoading', context: context);

  bool get isWeatherLoading {
    _$_isWeatherLoadingAtom.reportRead();
    return super._isWeatherLoading;
  }

  @override
  bool get _isWeatherLoading => isWeatherLoading;

  @override
  set _isWeatherLoading(bool value) {
    _$_isWeatherLoadingAtom.reportWrite(value, super._isWeatherLoading, () {
      super._isWeatherLoading = value;
    });
  }

  late final _$_citiesAtom =
      Atom(name: '_WeatherStore._cities', context: context);

  List<Location> get cities {
    _$_citiesAtom.reportRead();
    return super._cities;
  }

  @override
  List<Location> get _cities => cities;

  @override
  set _cities(List<Location> value) {
    _$_citiesAtom.reportWrite(value, super._cities, () {
      super._cities = value;
    });
  }

  late final _$_weatherAtom =
      Atom(name: '_WeatherStore._weather', context: context);

  Weather? get weather {
    _$_weatherAtom.reportRead();
    return super._weather;
  }

  @override
  Weather? get _weather => weather;

  @override
  set _weather(Weather? value) {
    _$_weatherAtom.reportWrite(value, super._weather, () {
      super._weather = value;
    });
  }

  late final _$_searchCitiesAsyncAction =
      AsyncAction('_WeatherStore._searchCities', context: context);

  @override
  Future<void> _searchCities(String searchText) {
    return _$_searchCitiesAsyncAction
        .run(() => super._searchCities(searchText));
  }

  late final _$fetchWeatherForAsyncAction =
      AsyncAction('_WeatherStore.fetchWeatherFor', context: context);

  @override
  Future<void> fetchWeatherFor(Location location, String language) {
    return _$fetchWeatherForAsyncAction
        .run(() => super.fetchWeatherFor(location, language));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
