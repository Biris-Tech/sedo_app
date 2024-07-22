import 'package:sedo_app/models/notification.dart';
import 'package:stacked/stacked.dart';

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
}
