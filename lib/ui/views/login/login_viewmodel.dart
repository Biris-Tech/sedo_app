import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/app/app.router.dart';
import 'package:sedo_app/models/login.dart';
import 'package:sedo_app/services/login_service.dart';
import 'package:sedo_app/ui/views/login/login_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  bool _allInputFull = false;
  bool get allInputFull => _allInputFull;
  bool _passwordVisible = false;
  bool get passwordVisible => _passwordVisible;
  final _navigationService = locator<NavigationService>();
  final _loginService = locator<LoginService>();

  void checkAllInputFull() {
    print("allinput $allInputFull");
    if (passwordValue == null || phoneOrEmailValue == null) {
      _allInputFull = false;
    } else {
      if (passwordValue!.isNotEmpty && phoneOrEmailValue!.isNotEmpty) {
        _allInputFull = true;
        print("allinput $allInputFull");
      } else {
        _allInputFull = false;
      }
    }
    rebuildUi();
  }

  Future<void> fetchLogin(Login user) async {
    setBusy(true);
    try {
      await _loginService.login(user);
      rebuildUi();
    } catch (error) {
      print(error);
    } finally {
      setBusy(false);
    }
  }

  void obscurePassword() {
    _passwordVisible = !_passwordVisible;
    rebuildUi();
  }

  void goToHome() => _navigationService.replaceWithHomeView();
  void goToRegister() => _navigationService.replaceWithRegisterView();
}
