import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/app/app.router.dart';
import 'package:sedo_app/models/api_url.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/models/otp.dart';
import 'package:sedo_app/models/register.dart';
import 'package:http/http.dart' as http;
import 'package:sedo_app/services/otp_service.dart';
import 'package:sedo_app/services/uidstorage_service.dart';
import 'package:stacked_services/stacked_services.dart' hide SnackPosition;

class RegisterService {
  final _otpService = locator<OtpService>();
  final _navigationService = locator<NavigationService>();
   final _userIdService = locator<UidstorageService>();
   
  Future<void> fectchUser(Register user, Otp otp, bool isDone) async {
    isDone = true;
    try {
      var url = Uri.parse(registerRoute);
      var response = await http.post(
        url,
        body: jsonEncode(user.toJson()),
        headers: headers,
      );
      print("response ${response.body}");
      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        userId = jsonBody['users']['id'];
        userName = jsonBody['users']['name'];
        userEmail = jsonBody['users']['email'];
        userSurname = jsonBody['users']['surname'];
      _userIdService.storeUserId(userId);
      _userIdService.storeUserName(userName);
      _userIdService.storeUserSurName(userSurname);
      _userIdService.storeUserEmail(userEmail);
      //_userIdService.storeUserPhone()

        print(userId);
        await _otpService.sendOtp(otp);
        await _navigationService.navigateTo(Routes.otpView);
      } else {
        if (response.statusCode == 400) {
          Get.snackbar("Erreur", "Cet email est déjà utilisé.",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
              colorText: Colors.white);
        }
        if (response.statusCode == 500) {
          Get.snackbar("Erreur", "Vérifier votre connexion internet.",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
              colorText: Colors.white);
        }
      }
    } catch (error) {
      print(error);
    } finally {
      isDone = false;
    }
  }
}
