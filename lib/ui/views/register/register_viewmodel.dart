import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/app/app.router.dart';
import 'package:sedo_app/ui/views/register/register_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends FormViewModel {
  bool _allInputFull = false;
  bool get allInputFull => _allInputFull;
  bool isDone = false;
  final _navigationService = locator<NavigationService>();
  void checkAllInputFull() {
    if (nameValue!.isNotEmpty &&
        surnameValue!.isNotEmpty &&
        emailValue!.isNotEmpty &&
        phoneValue!.isNotEmpty) {
      _allInputFull = true;
    } else {
      _allInputFull = false;
    }
    rebuildUi();
  }

  void navigateToPassword() {
    if (_allInputFull) {
      _navigationService.replaceWithPasswordView();
    }
  }

  void goToLoginView() => _navigationService.navigateToLoginView();
}
