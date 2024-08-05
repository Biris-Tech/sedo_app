import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/app/app.router.dart';
import 'package:sedo_app/models/api_url.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/models/login.dart';
import 'package:http/http.dart' as http;
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/views/home/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _navigationService = locator<NavigationService>();

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
      print("res = $userId");
      await _prefs.then((SharedPreferences prefs) {
        prefs.setString('userToken', tokenSave);
      });
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
