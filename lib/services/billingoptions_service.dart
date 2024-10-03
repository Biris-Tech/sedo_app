import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/ui/common/app_card.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/input_component.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/button_component.dart';

class BillingoptionsService {
  Future bottomSheetBillingOptions(
    BuildContext context,
    Function()? onPressed,
    Function()? onEspecePressed,
  ) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        ),
        builder: (context) => Container(
              child: SizedBox(
                height: 178,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/Box.svg",
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const TextComponent(
                            "Recherche d'un coursier",
                            fontsize: 18,
                            fontweight: FontWeight.w700,
                            textcolor: Color(0xFF202020),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextComponent(
                            "Recherche en cours...",
                            fontsize: 14,
                            fontweight: FontWeight.w700,
                            textcolor: const Color(0xFF202020).withOpacity(0.5),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const TextComponent(
                              "Annuler",
                              fontsize: 14,
                              fontweight: FontWeight.w700,
                              textcolor: kcPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 28),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 16,
                              ),
                              SvgPicture.asset('assets/money.svg',
                                  height: 22, width: 22),
                              const SizedBox(
                                width: 4,
                              ),
                              const TextComponent(
                                "Espèces",
                                fontsize: 14,
                                fontweight: FontWeight.w700,
                                textcolor: Color(0xFF202020),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                onTap: onEspecePressed,
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                  Stack(
                    children: [
                      ButtonNextComponent("continuer", onPressed: onPressed),
                      if (coursesStatus != "ACCEPTED") // Vérification du statut
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white70, // Couleur semi-transparente pour blanchir
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                    ],
                  ),
                            ],
                          ),
                        )),
                    if (coursesStatus != "ACCEPTED")
                      const LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(kcPrimaryColor),
                      ),
                  ],
                ),
              ),
            ));
  }

  Future bottomSheetChoosenBillingOptions(
    BuildContext context,
    Function()? onPressed,
    Function()? onEspecePressed,
    Function()? onMomoPressed,
    Function()? onCardPressed,
  ) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        ),
        builder: (context) => Container(
              child: SizedBox(
                height: 468,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          TextComponent(
                            "Mode de paiement",
                            fontsize: 18,
                            fontweight: FontWeight.w700,
                            textcolor: Color(0xFF202020),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: BillCard(
                        iconPath: "assets/money.svg",
                        height: 21.5,
                        width: 15.5,
                        bill: "Espèces",
                        onPressed: onEspecePressed,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: BillCard(
                        iconPath: "assets/iPhone.svg",
                        height: 21.5,
                        width: 17.5,
                        bill: "MTN, MOOV, Orange",
                        onPressed: onMomoPressed,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: BillCard(
                        iconPath: "assets/Card.svg",
                        height: 24,
                        width: 24,
                        bill: "Carte bancaire",
                        onPressed: onCardPressed,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/Ticket.svg",
                            height: 18,
                            width: 20,
                          ),
                          const SizedBox(width: 6),
                          const TextComponent(
                            "Code promo",
                            fontsize: 14,
                            fontweight: FontWeight.w700,
                            textcolor: Color(0xFF202020),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          TextComponent(
                            "Ajouter un code promo",
                            fontsize: 14,
                            fontweight: FontWeight.w500,
                            textcolor: Color(0xFF202020),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextInputField(
                        height: 40,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              ButtonNextComponent(
                                "Appliquer",
                                onPressed: onPressed,
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ));
  }

  Future bottomSheetCourierFound(
    BuildContext context,
    String selectedPayement,
    String selectedPayementIconPath,
    String deliveryPrice,
    String ancientPrice,
    String remainingTimes,
    Function()? onPressed,
    //Function()? onEspecePressed,
  ) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        ),
        builder: (context) => Container(
              child: SizedBox(
                height: 233,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/Box.svg",
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const TextComponent(
                            "Coursier potentiel trouvé",
                            fontsize: 18,
                            fontweight: FontWeight.w700,
                            textcolor: Color(0xFF202020),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: courierCard(
                            deliveryPrice, ancientPrice, remainingTimes)),
                    const Expanded(child: SizedBox()),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 28),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              // const SizedBox(
                              //   width: 12,
                              // ),
                              SvgPicture.asset(selectedPayementIconPath,
                                  height: 22, width: 22),
                              const SizedBox(
                                width: 4,
                              ),
                              TextComponent(
                                selectedPayement,
                                fontsize: 14,
                                fontweight: FontWeight.w700,
                                textcolor: const Color(0xFF202020),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                //onTap: onEspecePressed,
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              ButtonNextComponent("continuer",
                                  onPressed: onPressed),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ));
  }

  Future bottomSheetCoursesOnLoad(
  BuildContext context,
  Function()? onPressed,
) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    isDismissible: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
    ),
    builder: (context) => Container(
      child: SizedBox(
        height: 233,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/Box.svg", // Icone de livraison
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const TextComponent(
                    "Livraison en cours",  // Changement du texte
                    fontsize: 18,
                    fontweight: FontWeight.w700,
                    textcolor: Color(0xFF202020),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: courierCardInProgress(
              ),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 28),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                  
                    const SizedBox(
                      width: 4,
                    ),
                    
                    const Expanded(child: SizedBox()),
                   Stack(
                    children: [
                      ButtonNextComponent("continuer", onPressed: onPressed),
                      if (coursesStatus != "COMPLETED") // Vérification du statut
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white70, // Couleur semi-transparente pour blanchir
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                    ],
                  ),
                  ],
                ),
              ),
            ),
              if (coursesStatus != "COMPLETED")
                      const LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(kcPrimaryColor),
                      ),
          ],
        ),
      ),
    ),
  );
}

}
