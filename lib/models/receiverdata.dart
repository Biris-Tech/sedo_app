class ReceiverData {
  double latitude;
  double longitude;
  String phone;
  ReceiverData({
    required this.latitude,
    required this.longitude,
    required this.phone,
  });

  factory ReceiverData.fromJson(Map<String, dynamic> json) {
    return ReceiverData(
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