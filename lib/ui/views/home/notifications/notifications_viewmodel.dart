import 'dart:convert';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:sedo_app/models/api_url.dart';
import 'package:sedo_app/services/uidstorage_service.dart';

class NotificationsViewModel extends BaseViewModel {
  List<ShippingCourse> courses = [];

  Future<void> getCourses() async {
    String userId = (await UidstorageService().getUserId())!;
    var url = Uri.parse("$shippingProposalRoute/user/$userId");
    print(url);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      courses = data
          .map((json) => ShippingCourse.fromJson(json as Map<String, dynamic>))
          .toList(); // Décodage de la réponse JSON
      print(courses); // Conversion en liste d'objets ShippingCourse
      notifyListeners(); // Mise à jour de l'interface
    } else {
      print(
          'Erreur lors de la récupération des courses: ${response.statusCode}');
    }
  }

  NotificationsViewModel() {
    getCourses();
  }
}

class ShippingCourse {
  final String id;
  final String title;
  final String departureLocation;
  final String arrivalLocation;
  final String status;
  final String receiverPhone;
  final String senderPhone;

  ShippingCourse({
    required this.id,
    required this.title,
    required this.departureLocation,
    required this.arrivalLocation,
    required this.status,
    required this.receiverPhone,
    required this.senderPhone,
  });

  factory ShippingCourse.fromJson(Map<String, dynamic> json) {
    return ShippingCourse(
      id: json['id'] ?? '', 
      title: json['title'] ?? 'Titre non disponible', 
      departureLocation: json['departure_location'] ?? 'Lieu de départ non disponible',
      arrivalLocation: json['arrival_location'] ?? 'Lieu d\'arrivée non disponible',
      status: json['status'] ?? 'Statut inconnu',
      receiverPhone: json['ReceiverData']?['phone'] ?? 'Téléphone du destinataire non disponible',
      senderPhone: json['SenderData']?['phone'] ?? 'Téléphone de l\'expéditeur non disponible',
    );
  }
}