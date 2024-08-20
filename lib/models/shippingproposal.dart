import 'package:sedo_app/models/receiverdata.dart';
import 'package:sedo_app/models/senderdata.dart';

class ShippingProposal {
  String departureLocation;
  String arrivalLocation;
  String title;
  String description;
  bool? deliveryExpress;
  String? duration;
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
    required this.distance,
    required this.receiverData,
    required this.senderData,
    required this.amount,
  });

  ShippingProposal.create({
    required this.departureLocation,
    required this.arrivalLocation,
    required this.title,
    required this.description,
    this.deliveryExpress,
    this.duration,
    required this.distance,
    required this.amount,
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
      distance: json['Distance'],
      duration: json['Dure'],
      amount: json['Amount'],
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
      'Distance': distance,
      'Dure': duration,
      'amount': amount
    };
  }
}
