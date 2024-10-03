import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BillCard extends StatefulWidget {
  final String iconPath;
  final double height;
  final double width;
  final String bill;
  final Function()? onPressed;

  const BillCard({
    required this.iconPath,
    required this.height,
    required this.width,
    required this.bill,
    this.onPressed,
    super.key,
  });

  @override
  _BillCardState createState() => _BillCardState();
}

class _BillCardState extends State<BillCard> {
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTap = !isTap;
        });
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF202020), width: 1),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Row(
              children: [
                SvgPicture.asset(
                  widget.iconPath,
                  height: widget.height,
                  width: widget.width,
                ),
                const SizedBox(width: 4),
                TextComponent(
                  widget.bill,
                  fontsize: 14,
                  fontweight: FontWeight.w600,
                  textcolor: const Color(0xFF202020),
                ),
                const Expanded(child: SizedBox()),
                isTap
                    ? const FaIcon(FontAwesomeIcons.circleCheck)
                    : const FaIcon(FontAwesomeIcons.chevronRight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Container courierCard(
    String deliveryPrice, String ancientPrice, String remainingTimes) {
  return Container(
    height: 62,
    decoration: BoxDecoration(
        color: const Color(0xFFB7B7B7).withOpacity(0.2),
        borderRadius: BorderRadius.circular(12)),
    child: Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 8),
        SvgPicture.asset(
          "assets/Scooter.svg",
          height: 24,
          width: 24,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextComponent(
                    "Zem coursier",
                    fontweight: FontWeight.w600,
                    fontsize: 14,
                    textcolor: kcDarkGreyColor,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "$ancientPrice fcfa",
                      style: TextStyle(
                        color: kcDarkGreyColor.withOpacity(0.2),
                        fontSize: 16,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: kcDarkGreyColor.withOpacity(0.2),
                        decorationThickness: 1.5,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextComponent(
                    "À $remainingTimes du point de récupération",
                    fontweight: FontWeight.w400,
                    fontsize: 12,
                    textcolor: kcDarkGreyColor.withOpacity(0.4),
                  ),
                  TextComponent(
                    "$deliveryPrice fcfa",
                    fontweight: FontWeight.w400,
                    fontsize: 14,
                    textcolor: kcDarkGreyColor,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
      ],
    ),
  );
}

Container courierCardInProgress() {
  return Container(
    height: 62,
    decoration: BoxDecoration(
      color: const Color(0xFFB7B7B7).withOpacity(0.2),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        const SizedBox(width: 8),
        SvgPicture.asset(
          "assets/Scooter.svg", // Icône du scooter
          height: 24,
          width: 24,
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              TextComponent(
                "Zem coursier",
                fontweight: FontWeight.w600,
                fontsize: 14,
                textcolor: kcDarkGreyColor,
              ),
              SizedBox(height: 4),
              TextComponent(
                "Le livreur vous contactera une fois sur place.",
                fontweight: FontWeight.w400,
                fontsize: 12,
                textcolor: Color(0xFF202020),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
      ],
    ),
  );
}

Container courierInfoCard(String courierName, String courierProfil) {
  return Container(
    height: 62,
    decoration: BoxDecoration(
        color: const Color(0xFFB7B7B7).withOpacity(0.2),
        borderRadius: BorderRadius.circular(12)),
    child: Row(
      children: [
        const SizedBox(width: 8),
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
              color: kcPrimaryColor,
              borderRadius: BorderRadius.circular(90),
              border: Border.all(color: kcPrimaryColor)),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: kcPrimaryColor,
            backgroundImage: AssetImage(courierProfil),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: TextComponent(
                courierName,
                fontweight: FontWeight.w600,
                fontsize: 14,
                textcolor: kcDarkGreyColor,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                for (int i = 0; i < 5; i++)
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Icon(
                      Icons.star,
                      size: 16,
                      color: i < 4 ? const Color(0xFFFFCC00) : Colors.grey,
                    ),
                  )
              ],
            )
          ],
        )
      ],
    ),
  );
}

Container deliveryDurationCard(String remainingTimes) {
  return Container(
    height: 62,
    decoration: BoxDecoration(
        color: const Color(0xFFB7B7B7).withOpacity(0.2),
        borderRadius: BorderRadius.circular(12)),
    child: Row(
      children: [
        const SizedBox(width: 8),
        SvgPicture.asset(
          "assets/ClockCircle.svg",
          height: 24,
          width: 24,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const TextComponent(
                "Durée estimée de la livraison",
                fontweight: FontWeight.w600,
                fontsize: 14,
                textcolor: kcDarkGreyColor,
              ),
              const SizedBox(
                height: 4,
              ),
              TextComponent(
                "$remainingTimes",
                fontweight: FontWeight.w400,
                fontsize: 12,
                textcolor: kcDarkGreyColor.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
