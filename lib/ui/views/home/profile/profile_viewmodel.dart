import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/services/tokensession_service.dart';
import 'package:sedo_app/services/uidstorage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sedo_app/app/app.router.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final userIdService = locator<UidstorageService>();
  final userTokenService = locator<TokensessionService>();
  String accountCreatedAt = "Créé il y 3 mois";
  String _phone = "57072691";
  String _email = "otisdgn@gmail.com";
  String _firstname = ""; // Initialisation par défaut
  String _lastname = "D";

  String get phone => _phone;
  String get email => _email;
  String get firstname => _firstname;
  String get lastname => _lastname;

  ProfileViewModel() {
    _initialize();
  }

  Future<void> _initialize() async {
    _lastname = await userIdService.getUserName() ?? userName;
    print("User's firstname: $_firstname");
    _firstname = await userIdService.getUserSurName() ?? userSurname;
    print("User's lastname: $_lastname");
    _phone = await userIdService.getUserPhoneNumber() ?? userPhone;
    _email = await userIdService.getUserEmail() ?? userEmail;
    notifyListeners();
  }

  disconectUser() {
    userTokenService.deleteToken();
    _navigationService.navigateToLoginView();
  }

  void goToCourseHistoricView() =>
      _navigationService.navigateToHistoricCoursesView();
  void goToAccountSettingView() =>
      _navigationService.navigateToAccountSettingView();
  void goToUpdateProfileView() =>
      _navigationService.navigateToUpdateProfileView();
}
