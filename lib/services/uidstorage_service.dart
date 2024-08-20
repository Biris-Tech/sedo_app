import 'package:shared_preferences/shared_preferences.dart';

class UidstorageService {


  Future<void> storeUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', userId);
  }

   Future<void> storeUserName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_surname', name);
  }

    Future<void> storeUserSurName(String surname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_surname', surname);
  }

   Future<void> storeUserEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
  }

   Future<void> storeUserPhone(String phoneNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_phone', phoneNumber);
  }

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('uid');
  }

   Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_name');
  }

   Future<String?> getUserSurName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_surname');
    
  }

   Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_email');
  }

   Future<String?> getUserPhoneNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_phone');
  }

}
