import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/button_component.dart';
import 'package:sedo_app/ui/common/input_component.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';

class CardcreateService {
  final cardNumberController = TextEditingController();
  final cardExpiryDateController = TextEditingController();
  final cardCvvController = TextEditingController();

  void hideCardNumber(String text) {
    cardNumberController.text = text.replaceAll(RegExp(r'\d'), '*');
    cardNumberController.selection =
        TextSelection.collapsed(offset: cardNumberController.text.length);
  }

  Future bottomSheetCardCreate(BuildContext context, final Function() saveCard,
      final Function() saveCardAndPay) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        ),
        builder: (BuildContext context) => SizedBox(
              height: screenHeight(context) - 70,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back),
                        ),
                        const SizedBox(width: 4),
                        const TextComponent(
                          "Ajouter une carte bancaire",
                          fontsize: 16,
                          fontweight: FontWeight.w700,
                          textcolor: kcDarkGreyColor,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SvgPicture.asset(
                    'assets/cardpay.svg',
                  ),
                  const SizedBox(height: 38),
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        TextComponent(
                          "Card number",
                          fontsize: 16,
                          fontweight: FontWeight.w400,
                          textcolor: Color(0xFF384047),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextInputField(
                      height: 46.94,
                      width: double.infinity,
                      keyboardType: TextInputType.number,
                      hintText: "0000 0000 0000 0000",
                      controller: cardNumberController,
                      onChanged: (value) {
                        hideCardNumber(value!);
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        TextComponent(
                          "Card expiry date",
                          fontsize: 16,
                          fontweight: FontWeight.w400,
                          textcolor: Color(0xFF384047),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextInputField(
                      height: 46.94,
                      width: double.infinity,
                      keyboardType: TextInputType.number,
                      hintText: "MM/YY",
                      controller: cardExpiryDateController,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        TextComponent(
                          "CVV (3 digits)",
                          fontsize: 16,
                          fontweight: FontWeight.w400,
                          textcolor: Color(0xFF384047),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextInputField(
                      height: 46.94,
                      width: double.infinity,
                      keyboardType: TextInputType.number,
                      hintText: "000",
                      controller: cardCvvController,
                      onChanged: (value) {
                        // Handle CVV input change here if needed
                      },
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 28, left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonTrueComponent(
                            height: 40,
                            width: 144,
                            "Enregistrer",
                            onPressed: saveCard),
                        InkWell(
                          onTap: saveCardAndPay,
                          child: buttonSimple(40, 159, "Enregistrer et payer"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
