import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/ui/common/button_component.dart';
import 'package:sedo_app/ui/common/expressdelivery_card.dart';
import 'package:sedo_app/ui/common/text_components.dart';

class ExpressdeliveryService {
  Future bottomSheetExpressDelivery(
      BuildContext context, final Function()? onPressed) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(48)),
      ),
      builder: (context) => SizedBox(
        height: 269,
        child: DeliveryOptions(
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class DeliveryOptions extends StatefulWidget {
  final Function()? onPressed;

  const DeliveryOptions({super.key, this.onPressed});

  @override
  _DeliveryOptionsState createState() => _DeliveryOptionsState();
}

class _DeliveryOptionsState extends State<DeliveryOptions> {
  void _onOptionSelected(String option) {
    setState(() {
      duration = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextComponent(
              "Livraison Express",
              fontsize: 14,
              fontweight: FontWeight.w700,
              textcolor: const Color(0xFF202020),
              fontfamily: GoogleFonts.lexend().fontFamily,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextComponent(
            "Cette offre vous permet d’effectuer des livraison dans des delais plus precis.",
            fontweight: FontWeight.w400,
            fontsize: 12,
            fontfamily: GoogleFonts.lexend().fontFamily,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              DeliveryExpressCard(
                option: "30 mn",
                selectedOption: duration,
                onSelected: _onOptionSelected,
              ),
              const SizedBox(width: 8),
              DeliveryExpressCard(
                option: "1 H",
                selectedOption: duration,
                onSelected: _onOptionSelected,
              ),
              const SizedBox(width: 8),
              DeliveryExpressCard(
                option: "1H 30",
                selectedOption: duration,
                onSelected: _onOptionSelected,
              ),
              const SizedBox(width: 8),
              DeliveryExpressCard(
                option: "24 H",
                selectedOption: duration,
                onSelected: _onOptionSelected,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.only(bottom: 28),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: ButtonTrueComponent("Annuler",
                      height: 48,
                      width: 144.5,
                      onPressed: () => Navigator.pop(context)),
                ),
                GestureDetector(
                    onTap: () => widget.onPressed!(),
                    child: buttonSimple(48, 164.5, "Valider"))
              ],
            ),
          ),
        )
      ],
    );
  }
}
