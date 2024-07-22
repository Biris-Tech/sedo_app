import 'dart:convert';

import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/app/app.router.dart';
import 'package:sedo_app/models/api_url.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/models/otp.dart';
import 'package:sedo_app/models/register.dart';
import 'package:http/http.dart' as http;
import 'package:sedo_app/services/otp_service.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterService {
  final _otpService = locator<OtpService>();
  final _navigationService = locator<NavigationService>();

  Future<void> fectchUser(Register user, Otp otp, bool isDone) async {
    isDone = true;
    try {
      var url = Uri.parse(registerRoute);
      var response = await http.post(
        url,
        body: jsonEncode(user.toJson()),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        userId = jsonBody['users']['id'];
        print(userId);
        await _otpService.sendOtp(otp);
        await _navigationService.navigateTo(Routes.otpView);
      }
    } catch (error) {
      print(error);
    } finally {
      isDone = false;
    }
  }
}
