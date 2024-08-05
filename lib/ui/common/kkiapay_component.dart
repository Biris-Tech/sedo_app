import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kkiapay_flutter_sdk/kkiapay_flutter_sdk.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/ui/common/app_dialog.dart';
import 'package:sedo_app/ui/views/home/home_view.dart';

void callback(response, context) {
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
  phone: "22961000000",
  name: userName,
  email: userEmail,
  reason: 'Transaction reason',
  data: 'Fake data',
  sandbox: true,
  apikey: kkiapayApiKey,
  callback: callback, // Using context here directly might cause issues.
  theme: defaultTheme,
  paymentMethods: ["momo", "card"],
);

int stringToInt(String numberString) {
  double numberDouble = double.parse(numberString);
  int numberInt = numberDouble.round();
  return numberInt;
}
