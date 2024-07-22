import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/app/app.router.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/models/otp.dart';
import 'package:sedo_app/models/register.dart';
import 'package:sedo_app/services/register_service.dart';
import 'package:sedo_app/ui/views/register/password/password_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PasswordViewModel extends FormViewModel {
  bool _allInputFull = false;
  bool get allInputFull => _allInputFull;
  bool _passwordVisible = false;
  bool get passwordVisible => _passwordVisible;
  bool isDone = false;
  final _navigationService = locator<NavigationService>();
  final _registerService = locator<RegisterService>();

  void checkAllInputFull() {
    if (passwordValue!.isNotEmpty && confirmPasswordValue!.isNotEmpty) {
      _allInputFull = true;
    } else {
      _allInputFull = false;
    }
    rebuildUi();
  }

  void obscurePassword() {
    _passwordVisible = !_passwordVisible;
    rebuildUi();
  }

  void navigateToOtp() {
    if (_allInputFull) {
      _navigationService.replaceWithOtpView();
    }
  }

  void goBackToRegister() => _navigationService.replaceWithRegisterView();

  void goBackToLogin() => _navigationService.replaceWithLoginView();

  Future<void> register(
    Register user,
    Otp otp,
  ) async {
    setBusy(true);
    try {
      await _registerService.fectchUser(
        user,
        otp,
        isDone,
      );
      rebuildUi();
    } catch (error) {
      print(error);
    } finally {
      setBusy(false);
    }
  }

  @override
  void setFormStatus() {
    print("name $userName");
  }
}
