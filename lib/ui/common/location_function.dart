import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sedo_app/models/constants.dart';

Future getRegionFromCoordinates(
    double latitude, double longitude, String apiKey) async {
  final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status'] == 'OK') {
      final results = data['results'];
      if (results.isNotEmpty) {
        // Parse the address components to find the region
        final addressComponents = results[0]['address_components'];
        for (var component in addressComponents) {
          if (component['types'].contains('administrative_area_level_1')) {
            region = component['long_name'];
            print('Region: $region');
          }
        }
        print('Region not found');
      } else {
        print('No results found');
      }
    } else {
      print('Error: ${data['status']}');
    }
  } else {
    print('Failed to connect to the API: ${response.statusCode}');
  }
}

Future getDistanceBetweenPoints(double startLatitude, double startLongitude,
    double endLatitude, double endLongitude, String apiKey) async {
  print(
      'start latitude: $startLatitude, start longitude: $startLongitude, end latitude: $endLatitude, end longitude: $endLongitude');
  final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/distancematrix/json?origins=$startLatitude,$startLongitude&destinations=$endLatitude,$endLongitude&key=$apiKey');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print(data);
    if (data['status'] == 'OK') {
      final elements = data['rows'][0]['elements'][0];
      if (elements['status'] == 'OK') {
        final distanceInMeters = elements['distance']['value'];
        print(distanceInMeters);
        final distanceInKilometers = distanceInMeters / 1000;
        distance = distanceInKilometers;
        shipPrice = (distance * 100).toString();
        print('Distance: $distance km');
        print('ship price: $shipPrice');
      } else {
        throw Exception('Error: ${elements['status']}');
      }
    } else {
      throw Exception('Error: ${data['status']}');
    }
  } else {
    throw Exception('Failed to connect to the API: ${response.statusCode}');
  }
}

Future<void> calculateDuration(double originLat, double originLng,
    double destinationLat, double destinationLng) async {
  var url = Uri.parse(
      'https://maps.googleapis.com/maps/api/directions/json?origin=$originLat,$originLng&destination=$destinationLat,$destinationLng&key=$googleApiKey');

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    deliveryTime =
        data['routes'][0]['legs'][0]['duration']['text']; // Durée en texte
    print('Durée estimée du trajet : $duration');
  } else {
    print('Erreur: ${response.statusCode}');
  }
}
