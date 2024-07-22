import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/button_component.dart';
import 'package:sedo_app/ui/common/input_component.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';

class NumcreateService {
  Future bottomSheetNumCreate(BuildContext context, final Function() saveNum,
      final Function() saveNumAndPay) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => NumCreateView(
        saveNum: saveNum,
        saveNumAndPay: saveNumAndPay,
      ),
    );
  }
}

class NumCreateView extends StatefulWidget {
  const NumCreateView(
      {super.key, required this.saveNum, required this.saveNumAndPay});

  final Function() saveNum;
  final Function() saveNumAndPay;

  @override
  State createState() => _NumCreateViewState();
}

class _NumCreateViewState extends State<NumCreateView> {
  final numController = TextEditingController();
  String? selectedOperator; // Track the selected operator

  final List<String> operators = ['MTN Momo', 'Moov Money', 'Orange Money'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) - 70,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                  "Ajouter un numéro de téléphone",
                  fontsize: 16,
                  fontweight: FontWeight.w700,
                  textcolor: kcDarkGreyColor,
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          SvgPicture.asset(
            'assets/isnum.svg',
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 4),
            child: Row(
              children: [
                TextComponent(
                  "Numéro de téléphone",
                  fontsize: 16,
                  fontweight: FontWeight.w400,
                  textcolor: kcDarkGreyColor,
                  fontfamily: GoogleFonts.roboto().fontFamily,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextInputField(
              height: 48,
              keyboardType: TextInputType.phone,
              controller: numController,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 4),
            child: Row(
              children: [
                TextComponent(
                  "Operateur",
                  fontsize: 16,
                  fontweight: FontWeight.w400,
                  textcolor: kcDarkGreyColor,
                  fontfamily: GoogleFonts.roboto().fontFamily,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide:
                      const BorderSide(color: Color(0xFFDADFE1), width: 1.09),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide:
                      const BorderSide(color: Color(0xFFDADFE1), width: 1.09),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide:
                      const BorderSide(color: Color(0xFFDADFE1), width: 1.09),
                ),
              ),
              hint: Text(
                "Veuillez choisir votre opérateur",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                ),
              ),
              icon: const Icon(Icons.keyboard_arrow_down),
              value: selectedOperator,
              onChanged: (String? newValue) {
                setState(() {
                  selectedOperator = newValue;
                  numInfo.add(numController.text);
                  numInfo.add(selectedOperator!);
                  print(numInfo);
                });
              },
              items: operators.map((String operator) {
                return DropdownMenuItem<String>(
                  value: operator,
                  child: Text(operator),
                );
              }).toList(),
            ),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(bottom: 28, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonTrueComponent(
                    height: 40,
                    width: 144,
                    "Enregistrer",
                    onPressed: widget.saveNum),
                InkWell(
                  onTap: widget.saveNumAndPay,
                  child: buttonSimple(40, 169, "Enregistrer et payer"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
