import 'package:sedo_app/app/app.dialogs.dart';
import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/app/app.router.dart';
import 'package:sedo_app/models/otp.dart';
import 'package:sedo_app/services/otp_service.dart';
import 'package:sedo_app/ui/views/otp/otp_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OtpViewModel extends FormViewModel {
  bool _allInputFull = false;
  bool get allInputFull => _allInputFull;
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _otpService = locator<OtpService>();

  Future<void> fetchOtp(Otp otp) async {
    setBusy(true);
    try {
      await _otpService.verifyOtp(otp);
      rebuildUi();
    } catch (error) {
      print(error);
    } finally {
      setBusy(false);
    }
  }

  void checkAllInputFull({Otp? otp}) {
    if (otp1Value!.isNotEmpty &&
        otp2Value!.isNotEmpty &&
        otp3Value!.isNotEmpty &&
        otp4Value!.isNotEmpty) {
      fetchOtp(otp!);
    } else {
      _allInputFull = false;
    }
    rebuildUi();
  }

  void navigateToHome() {
    if (_allInputFull) {
      _navigationService.replaceWithHomeView();
    }
  }

  void goBackToRegister() {
    _navigationService.replaceWithPasswordView();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Félicitation!',
      description: 'votre compte a été créé avec succès.',
    );
  }
}
