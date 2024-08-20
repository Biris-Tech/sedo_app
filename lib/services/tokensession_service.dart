import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/app/app.router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

class TokensessionService {
  final _navigationService = locator<NavigationService>();

  Future<void> storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  Future<void> checkToken() async {
    String? token = await getToken();
    if (token != null) {
      print('Token is valid');
      _navigationService.navigateToHomeView();
    } else {
      print('Token is not valid');
      _navigationService.navigateToWelcomeView();
    }
  }
}
