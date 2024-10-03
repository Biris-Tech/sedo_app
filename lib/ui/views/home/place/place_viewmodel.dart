import 'dart:convert';
import 'package:stacked/stacked.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:sedo_app/models/place.dart';
import 'package:sedo_app/models/constants.dart';


class PlaceViewModel extends BaseViewModel {
  LocationData? currentLocation;
  List<Place> nearbyRestaurants = [];
  List<Place> suggestions = [];

  Future<void> fetchCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
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
