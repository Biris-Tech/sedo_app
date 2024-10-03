import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/ui/common/app_card.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/button_component.dart';

class DeliveryfinalizationService {
  Future bottomSheetDeliveryFinalization(
      BuildContext context,
      String deliveryPrice,
      String ancientPrice,
      String remainingTimes,
      String deliveryRemainingTimes,
      String courierName,
      String courierPhoto,
      String product,
      String productDescription,
      String? selectedPayementIconPath,
      String selectedPayement,
      String? expressDeliveryTime,
      final Function()? onPressed) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        ),
        builder: (context) => Container(
              child: SizedBox(
                height: screenHeight(context) - 50,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.arrow_back, size: 24)),
                            const SizedBox(
                              width: 8,
                            ),
                            const TextComponent(
                              "Finalisation de la course",
                              fontsize: 18,
                              fontweight: FontWeight.w700,
                              textcolor: Color(0xFF202020),
                            ),
                          ],
                        )),
                    const SizedBox(height: 48),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: courierInfoCard(courierName, courierPhoto),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: courierCard(
                          deliveryPrice, ancientPrice, remainingTimes),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: deliveryDurationCard(deliveryRemainingTimes)),
                    const SizedBox(height: 16),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 16),
                    //   child: Row(
                    //     children: [
                    //       TextComponent(
                    //         "info sur la course",
                    //         fontweight: FontWeight.w600,
                    //         fontsize: 16,
                    //         textcolor: kcDarkGreyColor.withOpacity(0.6),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(height: 12),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 16),
                    //   child: Row(
                    //     children: [
                    //       TextComponent(
                    //         product,
                    //         fontweight: FontWeight.w700,
                    //         fontsize: 14,
                    //         textcolor: kcDarkGreyColor,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(height: 4),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 16),
                    //   child: TextComponent(
                    //     productDescription,
                    //     fontweight: FontWeight.w400,
                    //     fontsize: 12,
                    //     textcolor: kcDarkGreyColor,
                    //   ),
                    // ),
                    // const SizedBox(height: 12),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       const SizedBox(),
                    //       ButtonTrueComponent(
                    //         "Modifier",
                    //         onPressed: () {
                    //           Navigator.pop(context);
                    //         },
                    //       )
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 28),
                    Padding(
                        padding: const EdgeInsets.only(left: 16, right: 28),
                        child: Row(children: [
                          // const SizedBox(
                          //   width: 16,
                          // ),
                          SvgPicture.asset(
                              selectedPayementIconPath ?? 'assets/money.svg',
                              height: 22,
                              width: 22),
                          const SizedBox(
                            width: 6,
                          ),
                          TextComponent(
                            selectedPayement,
                            fontsize: 14,
                            fontweight: FontWeight.w700,
                            textcolor: const Color(0xFF202020),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        ])),
                    const SizedBox(
                      height: 40,
                    ),
                   
                    const Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 28),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            ButtonNextComponent(
                                height: 48, "Finaliser", onPressed: onPressed),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
