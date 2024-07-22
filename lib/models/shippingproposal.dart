import 'package:sedo_app/models/receiverdata.dart';
import 'package:sedo_app/models/senderdata.dart';

class ShippingProposal {
  String departureLocation;
  String arrivalLocation;
  String title;
  String description;
  bool? deliveryExpress;
  String? duration;
  String region;
  double distance;
  String amount;
  ReceiverData receiverData;
  SenderData senderData;

  ShippingProposal({
    required this.departureLocation,
    required this.arrivalLocation,
    required this.title,
    required this.description,
    this.deliveryExpress,
    this.duration,
    required this.region,
    required this.distance,
    required this.receiverData,
    required this.senderData,
    this.amount = '',
  });

  ShippingProposal.create({
    required this.departureLocation,
    required this.arrivalLocation,
    required this.title,
    required this.description,
    this.deliveryExpress,
    this.duration,
    required this.region,
    required this.distance,
    this.amount = '',
    required double recoveryLatitude,
    required double recoveryLongitude,
    required String recoveryPhone,
    required double destinationLatitude,
    required double destinationLongitude,
    required String destinationPhone,
  })  : receiverData = ReceiverData(
          latitude: recoveryLatitude,
          longitude: recoveryLongitude,
          phone: recoveryPhone,
        ),
        senderData = SenderData(
          latitude: destinationLatitude,
          longitude: destinationLongitude,
          phone: destinationPhone.substring(4),
        );

  factory ShippingProposal.fromJson(Map<String, dynamic> json) {
    return ShippingProposal(
      departureLocation: json['departure_location'],
      arrivalLocation: json['arrival_location'],
      title: json['title'],
      description: json['description'],
      receiverData: ReceiverData.fromJson(json['ReceiverData']),
      deliveryExpress: json['deliveryExpress'],
      senderData: SenderData.fromJson(json['SenderData']),
      region: json['Region'],
      distance: json['Distance'],
      duration: json['Dure'],
      amount: ""
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'departure_location': departureLocation,
      'arrival_location': arrivalLocation,
      'title': title,
      'description': description,
      'ReceiverData': receiverData.toJson(),
      'deliveryExpress': deliveryExpress,
      'SenderData': senderData.toJson(),
      'Region': region,
      'Distance': distance,
      'Dure': duration,
      'amount': amount
    };
  }
}
