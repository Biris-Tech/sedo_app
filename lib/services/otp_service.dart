import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sedo_app/app/app.dialogs.dart';
import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/models/api_url.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/models/otp.dart';
import 'package:stacked_services/stacked_services.dart';

final _dialogService = locator<DialogService>();

class OtpService {
  Future<void> verifyOtp(Otp otp) async {
    var url = Uri.parse("$otpRoute/$userId");
    var response = await http.post(
      url,
      body: jsonEncode(otp.toJson()),
      headers: headers,
    );
    print(jsonEncode(otp.toJson()));
    if (response.statusCode == 200) {
      showDialog();
    } else {
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Erreur!',
        description: 'Code OTP incorrect.',
      );
    }
  }

  Future<void> sendOtp(Otp otp) async {
    var url = Uri.parse("$sendOtpRoute/$userId");
    var response = await http.post(
      url,
      body: jsonEncode(otp.sendOtpJson()),
      headers: headers,
    );
    print(jsonEncode(otp.toJson()));
    print(response.statusCode);
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Félicitation!',
      description: 'votre compte a été créé avec succès.',
    );
  }
}
