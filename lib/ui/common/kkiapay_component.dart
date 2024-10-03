import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/ui/common/app_dialog.dart';
import 'package:sedo_app/ui/views/home/home_view.dart';
import 'package:sedo_app/services/uidstorage_service.dart';
import 'package:kkiapay_flutter_sdk/kkiapay_flutter_sdk.dart';

String? name;
String? email;
String? phone;

void callback(response, context) async {
  final userIdService = locator<UidstorageService>();

  name = await userIdService.getUserName();
  email = await userIdService.getUserEmail();
  phone = await userIdService.getUserPhoneNumber();

  switch (response['status']) {
    case PAYMENT_CANCELLED:
      Navigator.pop(context);
      debugPrint(PAYMENT_CANCELLED);
      break;
    case PAYMENT_INIT:
      debugPrint(PAYMENT_INIT);
      break;
    case PENDING_PAYMENT:
      debugPrint(PENDING_PAYMENT);
      break;
    case PAYMENT_SUCCESS:
      Navigator.pop(context);
      showCustomDialog(context,
          title: "Super !!",
          description:
              "Votre course est validee. Le livreur sera la d’ici quelques minutes.",
          buttonText: "Retourner a l'ecran d'accueil", onPressed: () {
        Get.to(() => const HomeView());
        print("delivery: $deliveryTime");
      });
      break;
    default:
      debugPrint(UNKNOWN_EVENT);
      break;
  }
}

final kkiapay = KKiaPay(
  amount: stringToInt(shipPrice),
  countries: const ["BJ", "CI", "SN", "TG"],
  phone: phone,
  name: name,
  email: email,
  reason: 'Transaction reason',
  data: 'Fake data',
  sandbox: false,
  apikey: "bedf6ccc3cdefb1f421450cccc51b3f79694af2f",
  callback: callback, // Using context here directly might cause issues.
  theme: defaultTheme,
  paymentMethods: const ["momo", "card"],
);

int stringToInt(String numberString) {
  print('shippy: $shipPrice');
  double numberDouble = double.parse(numberString);
  int numberInt = numberDouble.round();
  return numberInt;
}
