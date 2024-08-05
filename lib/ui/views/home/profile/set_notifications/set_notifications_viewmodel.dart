import 'package:stacked/stacked.dart';

class SetNotificationViewModel extends BaseViewModel {
  bool _deliveryNotificationIsActive = false;

  get deliveryNotificationIsActive => _deliveryNotificationIsActive;

  void toggleDeliveryNotificationStatus(newValue) {
    _deliveryNotificationIsActive = newValue;
    notifyListeners();
  }

  bool _dpIsComingIsComingAlert = false;

  get dpIsComingIsComingAlert => _dpIsComingIsComingAlert;

  void toggleDpIsComingIsComingAlert(newValue) {
    _dpIsComingIsComingAlert = newValue;
    notifyListeners();
  }
}
