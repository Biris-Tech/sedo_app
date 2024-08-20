class Place {
  final String name;
  final String address;
  final double lat;
  final double lng;

  Place({
    required this.name,
    required this.address,
    required this.lat,
    required this.lng,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      address: json['vicinity'],
      lat: json['geometry']['location']['lat'],
      lng: json['geometry']['location']['lng'],
    );
  }

  factory Place.fromAutocompleteJson(Map<String, dynamic> json) {
    return Place(
      name: json['description'],
      address: '', // Address might not be available in autocomplete results
      lat: 0,
      lng: 0,
    );
  }
}
