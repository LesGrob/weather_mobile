import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:weather_core/weather_core.dart';
import 'package:weather_http/weather_http.dart';

void main() {
  group('Location API test', () {
    final httpConfiguration = HttpServiceConfiguration(
      environmentType: EnvironmentType.mock,
      urlProtocol: URLProtocol.https,
      serverUrl: "test.api.amadeus.com",
      serverApiUrl: "/v1/",
      apiKey: "",
    );
    test('Success response', () async {
      final client = MockClient((request) async {
        final mapJson = {
          "data": [
            {
              "type": "location",
              "subType": "city",
              "name": "PARIS",
              "iataCode": "PAR",
              "address": {"CountryCode": "FR"},
              "geoCode": {"latitude": 49.01278, "longitude": 2.55},
              "relationships": [
                {
                  "id": "CDG",
                  "type": "Airport",
                  "href": "#/included/airports/CDG"
                },
                {
                  "id": "ORY",
                  "type": "Airport",
                  "href": "#/included/airports/ORY"
                }
              ]
            }
          ],
          "included": {
            "airports": {
              "CDG": {
                "name": "CHARLES DE GAULLE",
                "iataCode": "CDG",
                "subType": "Airport"
              },
              "ORY": {"name": "ORLY", "iataCode": "ORY", "subType": "Airport"}
            }
          },
          "meta": {
            "count": "1",
            "links": {
              "self":
                  "https://api.amadeus.net/v1/reference-data/locations/cities/keyword=PARIS&CountryCode=FR&include=AIRPORTS"
            }
          }
        };
        return Response(json.encode(mapJson), 200);
      });
      final locationAPI = LocationApiService(client, httpConfiguration);

      final result = await locationAPI.searchAddress("any");
      expect(result.failure, null);
      expect(result.result, isA<LocationSearchApiResponse>());
      expect(result.result?.addresses.length, 1);
      expect(result.result?.addresses.first.cityName, "PARIS");
      expect(result.result?.addresses.first.countryCode, "FR");
      expect(result.result?.addresses.first.latitude, 49.01278);
      expect(result.result?.addresses.first.longitude, 2.55);
    });

    test('400 failure response', () async {
      final client = MockClient((request) async {
        final mapJson = {
          "errors": [
            {
              "status": 400,
              "code": 32171,
              "title": "MANDATORY DATA MISSING",
              "detail": "Missing mandatory query parameter"
            }
          ]
        };
        return Response(json.encode(mapJson), 400);
      });
      final locationAPI = LocationApiService(client, httpConfiguration);

      final result = await locationAPI.searchAddress("any");
      expect(result.result, null);
      expect(result.failure, isA<NetworkServerException>());
      expect(
        (result.failure as NetworkServerException)
            .message
            .contains("Missing mandatory query parameter"),
        true,
      );
    });

    test('500 failure response', () async {
      final client = MockClient((request) async {
        final mapJson = {
          "errors": [
            {"status": 500, "code": 141, "title": "SYSTEM ERROR HAS OCCURRED"}
          ]
        };
        return Response(json.encode(mapJson), 500);
      });
      final locationAPI = LocationApiService(client, httpConfiguration);

      final result = await locationAPI.searchAddress("any");
      expect(result.result, null);
      expect(result.failure, isA<NetworkServerException>());
      expect(
        (result.failure as NetworkServerException)
            .message
            .contains("SYSTEM ERROR HAS OCCURRED"),
        true,
      );
    });
  });

  group('Weather API test', () {
    final httpConfiguration = HttpServiceConfiguration(
      environmentType: EnvironmentType.mock,
      urlProtocol: URLProtocol.https,
      serverUrl: "api.openweathermap.org",
      serverApiUrl: "/data/2.5/",
      apiKey: "",
    );
    test('Success response', () async {
      final client = MockClient((request) async {
        final mapJson = {
          "coord": {"lon": 10.99, "lat": 44.34},
          "weather": [
            {
              "id": 501,
              "main": "Rain",
              "description": "moderate rain",
              "icon": "10d"
            }
          ],
          "base": "stations",
          "main": {
            "temp": 298.48,
            "feels_like": 298.74,
            "temp_min": 297.56,
            "temp_max": 300.05,
            "pressure": 1015,
            "humidity": 64,
            "sea_level": 1015,
            "grnd_level": 933
          },
          "visibility": 10000,
          "wind": {"speed": 0.62, "deg": 349, "gust": 1.18},
          "rain": {"1h": 3.16},
          "clouds": {"all": 100},
          "dt": 1661870592,
          "sys": {
            "type": 2,
            "id": 2075663,
            "country": "IT",
            "sunrise": 1661834187,
            "sunset": 1661882248
          },
          "timezone": 7200,
          "id": 3163858,
          "name": "Zocca",
          "cod": 200
        };
        return Response(json.encode(mapJson), 200);
      });
      final weatherAPI = WeatherApiService(client, httpConfiguration);

      final result = await weatherAPI.getWeather(
        latitude: 44.34,
        longitude: 10.99,
        language: "en",
      );
      expect(result.failure, null);
      expect(result.result, isA<WeatherResponse>());
      expect(result.result?.longitude, 10.99);
      expect(result.result?.latitude, 44.34);
      expect(result.result?.rain1h, 3.16);
      expect(result.result?.rain3h, null);
      expect(result.result?.snow1h, null);
      expect(result.result?.snow3h, null);
    });

    test('500 failure response', () async {
      final client = MockClient((request) async {
        final mapJson = {};
        return Response(json.encode(mapJson), 500);
      });
      final weatherAPI = WeatherApiService(client, httpConfiguration);

      final result = await weatherAPI.getWeather(
        latitude: 44.34,
        longitude: 10.99,
        language: "en",
      );
      expect(result.result, null);
      expect(result.failure, isA<NetworkServerException>());
    });
  });
}
