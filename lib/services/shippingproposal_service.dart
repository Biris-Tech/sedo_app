import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/models/api_url.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/models/shippingproposal.dart';
import 'package:sedo_app/services/uidstorage_service.dart';
import 'package:sedo_app/ui/views/home/courier/courier_viewmodel.dart';

class ShippingproposalService {
  final _userIdService = locator<UidstorageService>();

  Future<void> createShippingProposal(
      ShippingProposal ship, BuildContext context) async {
    userId = (await _userIdService.getUserId())!;
    print("User ID: $userId");
    var url = Uri.parse("$shippingProposalRoute/$userId");
    Navigator.pop(context);
    print(ship.toJson());
    var response =
        await http.post(url, body: jsonEncode(ship.toJson()), headers: headers);
    print("response status: ${response.statusCode}");
    print("response ${response.body}");

    if (response.statusCode == 201) {
      if (context.mounted) {
        CourierViewModel courierViewModel = CourierViewModel();
        courierViewModel.showBillingOptions(context);
      }
    }
    else {
      
    }
  }
}
