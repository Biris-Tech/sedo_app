import 'dart:convert';

import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/models/api_url.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/models/user.dart';
import 'package:sedo_app/services/uidstorage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class UpdateProfileViewModel extends BaseViewModel {
  final _userIdService = locator<UidstorageService>();

  UpdateProfileViewModel() {
    init();
  }

  init() async {
    userId = (await _userIdService.getUserId())!;
    print(userId);
    rebuildUi();
  }

  Future<void> updateUser(UserModel user) async {
    try {
      var url = Uri.parse('$updateUserRoute/$userId');
      print(url);
      var res = await http.put(url,
          body: jsonEncode(user.toJson()), headers: headers);
      print(user.toJson());
      print(res.body);
      print(res.statusCode);
    } catch (e) {
      print('Error updating user: $e');
    } finally {}
  }
}
