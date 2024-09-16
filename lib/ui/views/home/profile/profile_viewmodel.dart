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
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  String accountCreatedAt = "Créé il y a 3 mois";
  String _phone = "57072691";
  String _email = "otisdgn@gmail.com";
  String _firstname = "hj";
  String _lastname = "";

  // Getters
  String get phone => _phone;
  String get email => _email;
  String get firstname => _firstname;
  String get lastname => _lastname;

  ProfileViewModel() {
    _initialize();
  }

  // Initialisation des données utilisateur à partir des services asynchrones
  Future<void> _initialize() async {
    _isLoading = true;
    notifyListeners();
    print('sff');
    _lastname = await userIdService.getUserName() ?? userName;
    print("User's lastname: $_lastname");

    _firstname = await userIdService.getUserSurName() ?? userSurname;
    print("User's firstname: $_firstname");

    _phone = await userIdService.getUserPhoneNumber() ?? userPhone;
    print("User's phone: $_phone");
    _email = await userIdService.getUserEmail() ?? userEmail;
    print("User's email: $_email");

    _isLoading = false;
    notifyListeners();
  }

  // Setters pour mettre à jour les valeurs et notifier les changements
  void setPhone(String value) {
    _phone = value;
    notifyListeners(); // Met à jour l'UI
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setFirstname(String value) {
    _firstname = value;
    notifyListeners();
  }

  void setLastname(String value) {
    _lastname = value;
    notifyListeners();
  }

  // Déconnexion de l'utilisateur
  void disconectUser() {
    userTokenService.deleteToken();
    _navigationService.navigateToLoginView();
  }

  // Navigation vers les différentes vues
  void goToCourseHistoricView() =>
      _navigationService.navigateToHistoricCoursesView();
  void goToAccountSettingView() =>
      _navigationService.navigateToAccountSettingView();
  void goToUpdateProfileView() =>
      _navigationService.navigateToUpdateProfileView();
}
