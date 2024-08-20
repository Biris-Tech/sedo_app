import 'package:sedo_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sedo_app/app/app.router.dart';

class AccountSettingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goToSetNotificationView() =>
      _navigationService.navigateToSetNotificationView();
}
