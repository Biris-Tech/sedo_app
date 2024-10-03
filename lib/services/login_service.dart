import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sedo_app/models/login.dart';
import 'package:sedo_app/app/app.router.dart';
import 'package:sedo_app/models/api_url.dart';
import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/services/uidstorage_service.dart';
import 'package:sedo_app/services/tokensession_service.dart';

class LoginService {
  final _navigationService = locator<NavigationService>();
  final _sessionTokenService = locator<TokensessionService>();
  final _userIdService = locator<UidstorageService>();

  Future<void> login(Login user) async {
    var url = Uri.parse(loginRoute);
    var response = await http.post(
      url,
      body: jsonEncode(user.toJson()),
      headers: headers,
    );
    print(response.body);
    if (response.statusCode == 200) {
      print("ok");
      final jsonBody = json.decode(response.body);
      token = jsonBody['token'];
      userId = jsonBody['userId'];
      userName = jsonBody['name'];
      userSurname = jsonBody['surname'];
      userEmail = jsonBody['email'];
      print("res = $userId");
      print("token = $token");
      _sessionTokenService.storeToken(token);
      _userIdService.storeUserId(userId);
      _userIdService.storeUserName(userName);
      _userIdService.storeUserSurName(userSurname);
      _userIdService.storeUserEmail(userEmail);
      _userIdService.storeUserPhone(userPhone);
      _navigationService.replaceWithHomeView();
    } else {
      ScaffoldMessenger(
          child: Container(
              color: Colors.red,
              height: 50,
              child: const Center(
                child: TextComponent("Identifiant ou mot de passe incorrect"),
              )));
    }
  }
}
