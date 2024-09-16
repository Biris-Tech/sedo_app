import 'package:sedo_app/models/api_url.dart';
import 'package:sedo_app/models/notification.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class NotificationsViewModel extends BaseViewModel {
  List<NotificationModel> notifications = [
    NotificationModel(
      date: '02 Mai 2024 18:30',
      text:
          'Félicitations. Vous avez effectué votre première commande. Nous sommes fier de vous accueillir parmi nos fiers clients.',
    ),
    NotificationModel(
      date: '02 Mai 2024 18:30',
      text:
          'Bonne nouvelle ! Un code promo vous est offert en l\'occasion du Ramadan.',
    ),
  ];

  Future<void> getNotifiations() async {
    var url = Uri.parse(notificationRoute);
    var response = await http.get(url);
    print('Response: ${response.body}');
  }

  NotificationsViewModel() {
    getNotifiations();
  }
}
