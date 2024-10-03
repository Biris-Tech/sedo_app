import 'dart:convert';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sedo_app/models/user.dart';
import 'package:sedo_app/models/api_url.dart';
import 'package:sedo_app/app/app.router.dart';
import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/services/uidstorage_service.dart';
import 'package:sedo_app/services/tokensession_service.dart';
import 'package:stacked_services/stacked_services.dart' hide Transition;

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final userIdService = locator<UidstorageService>();
  final userTokenService = locator<TokensessionService>();
  bool _isLoading = true;
  bool onLoading = false;

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
    notifyListeners(); // Pour afficher un indicateur de chargement
    userId = (await userIdService.getUserId())!;
    print(userId);
    try {
      _lastname = (await userIdService.getUserName()) ?? "";
      _firstname = (await userIdService.getUserSurName()) ?? "";
      _phone = (await userIdService.getUserPhoneNumber()) ?? "";
      _email = (await userIdService.getUserEmail()) ?? "";

      print("Données récupérées : $_firstname $_lastname $_phone $_email");
    } catch (e) {
      print("Erreur lors de la récupération des données : $e");
    } finally {
      _isLoading = false;
      notifyListeners(); // Mise à jour de l'UI après chargement
    }
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

  Future<void> updateUser(UserModel user) async {
    try {
      setBusy(true);
      var url = Uri.parse('$updateUserRoute/$userId');
      print(url);
      var res = await http.patch(url,
          body: jsonEncode(user.toJson()), headers: headers);
      if (res.statusCode == 200) {
        Get.snackbar('Info', 'Informations modifiées avec succès',
            backgroundColor: Colors.green, colorText: Colors.white);
        userIdService.storeUserName(firstname);
        userIdService.storeUserEmail(email);
        userIdService.storeUserPhone(phone);
        userIdService.storeUserSurName(lastname);
        Get.back();
      }
    } catch (e) {
      print('Error updating user: $e');
    } finally {
      setBusy(false);
    }
  }

  // Navigation vers les différentes vues
  void goToCourseHistoricView() =>
      _navigationService.navigateToHistoricCoursesView();
  void goToAccountSettingView() =>
      _navigationService.navigateToAccountSettingView();
  void goToUpdateProfileView() =>
      _navigationService.navigateToUpdateProfileView();
}
