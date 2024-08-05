import 'package:sedo_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sedo_app/app/app.router.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  String userName = "Ruben D.";

  String accountCreatedAt = "Créé il y 3 mois";

  String _phone = "57072691";

  get phone => _phone;

  String _email = "otisdgn@gmail.com";

  get email => _email;

  String _firstname = "Ruben";
  get firstname => _firstname;

  String _lastname = "DANGBEGNON";
  get lastname => _lastname;

  void goToCourseHistoricView() => _navigationService.navigateToHistoricCoursesView();
  void goToAccountSettingView() =>
      _navigationService.navigateToAccountSettingView();
  void goToUpdateProfileView() => _navigationService.navigateToUpdateProfilView();
}
