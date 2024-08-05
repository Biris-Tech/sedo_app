class SenderData {
  double latitude;
  double longitude;
  String phone;

  SenderData({
    required this.latitude,
    required this.longitude,
    required this.phone,
  });

  factory SenderData.fromJson(Map<String, dynamic> json) {
    return SenderData(
      latitude: json['latitude'],
      longitude: json['longitude'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'phone': phone,
    };
  }
}
