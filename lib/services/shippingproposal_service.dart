import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sedo_app/models/api_url.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/models/shippingproposal.dart';
import 'package:sedo_app/ui/views/home/courier/courier_viewmodel.dart';

class ShippingproposalService {
  Future<void> createShippingProposal(
      ShippingProposal ship, BuildContext context) async {
    var url = Uri.parse("$shippingProposalRoute/$userId");
    var response =
        await http.post(url, body: jsonEncode(ship.toJson()), headers: headers);
    print("response ${response.body}");
    if (response.statusCode == 201) {
      final jsonResponse = jsonDecode(response.body);

      shipPrice = jsonResponse['shippingProposal']['amount'];

      if (context.mounted) {
        CourierViewModel courierViewModel = CourierViewModel();
        Navigator.pop(context);
        courierViewModel.showBillingOptions(context);
      }
    }
  }
}
