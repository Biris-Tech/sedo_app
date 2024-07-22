import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Assurez-vous d'utiliser le bon package pour SvgPicture
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/button_component.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';

class NumlistService {
  Future bottomSheetnumList(BuildContext context, final Function() addNumber,
      final Function()? numConfirm) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      builder: (BuildContext context) => NumListView(
        addNumber: addNumber,
        numConfirm: numConfirm,
      ),
    );
  }
}

class NumListView extends StatefulWidget {
  const NumListView({super.key, required this.addNumber, this.numConfirm});

  final Function() addNumber;
  final Function()? numConfirm;

  @override
  State createState() => _NumListViewState();
}

class _NumListViewState extends State<NumListView> {
  // Simulation de la liste numInfo

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
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 4),
                const TextComponent(
                  "Mon numéro",
                  fontsize: 16,
                  fontweight: FontWeight.w700,
                  textcolor: kcDarkGreyColor,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: numInfo.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SvgPicture.asset("assets/isnum.svg"),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/emptynum.svg"),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 28, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonTrueComponent(
                  height: 40,
                  width: 144,
                  "Ajouter un numéro",
                  onPressed: widget.addNumber,
                ),
                InkWell(
                  onTap: widget.numConfirm,
                  child: buttonSimple(40, 159, "Confirmer"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
