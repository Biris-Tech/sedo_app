import 'dart:convert';

import 'package:location/location.dart';
import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/models/place.dart';
import 'package:sedo_app/services/location_service.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class PlaceViewModel extends BaseViewModel {
  LocationData? currentLocation;
  List<Place> nearbyRestaurants = [];
  List<Place> suggestions = [];

  Future<void> fetchCurrentLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    currentLocation = await location.getLocation();
    notifyListeners();
  }

  Future<void> fetchRestaurants(String query) async {
    const String url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Benin&key=$googleApiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      nearbyRestaurants = (result['results'] as List)
          .map((place) => Place.fromJson(place))
          .toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load nearby restaurants');
    }
  }

  Future<void> fetchSuggestions(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=establishment&key=$googleApiKey';

    final response = await http.get(Uri.parse(url));
    print(response.body); // For debugging purposes
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      suggestions = (result['predictions'] as List)
          .map((place) => Place.fromAutocompleteJson(place))
          .toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load suggestions');
    }
  }
}
