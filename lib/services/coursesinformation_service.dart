import 'package:flutter/material.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/ui/common/button_component.dart';
import 'package:sedo_app/ui/common/input_component.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';

class CoursesinformationService {
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseDescriptionController = TextEditingController();

  Future bottomSheetCoursesInfo(BuildContext context, Function()? onDeliveryPressed, Function()? onPressed) {
    print(screenWidth(context));
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      context: context,
      builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.height < 820;
        return SizedBox(
          height: screenHeight(context) - 100,
          child: isSmallScreen
              ? SingleChildScrollView(child: buildContent(context, onDeliveryPressed, onPressed))
              : buildContent(context, onDeliveryPressed, onPressed),
        );
      },
    );
  }

  Widget buildContent(BuildContext context, Function()? onDeliveryPressed, Function()? onPressed) {
    final isSmallScreen = MediaQuery.of(context).size.height < 820;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 8),
              const TextComponent(
                "Informations sur la course",
                fontsize: 18,
                fontweight: FontWeight.w700,
              ),
            ],
          ),
        ),
        Image.asset(
          "assets/info.png",
          height: 184,
          width: 295,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              TextComponent(
                "Pour faciliter le suivi de votre colis, nous vous",
                fontsize: 14,
                fontweight: FontWeight.w400,
                textcolor: const Color(0xff202020).withOpacity(0.5),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              TextComponent(
                "prions d’ajouter un titre à votre course. Ajoutez plus",
                fontsize: 14,
                fontweight: FontWeight.w400,
                textcolor: const Color(0xff202020).withOpacity(0.5),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              TextComponent(
                "de détails pour donner plus d’informations sur ",
                fontsize: 14,
                fontweight: FontWeight.w400,
                textcolor: const Color(0xff202020).withOpacity(0.5),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              TextComponent(
                "votre course au livreur.",
                fontsize: 14,
                fontweight: FontWeight.w400,
                textcolor: const Color(0xff202020).withOpacity(0.5),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.only(left: 16, bottom: 16),
          child: Row(
            children: [
              TextComponent(
                "Titre et détails de la course",
                fontsize: 16,
                fontweight: FontWeight.w600,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24, bottom: 4),
          child: Row(
            children: [
              TextComponent(
                "Titre de la course",
                fontsize: 14,
                fontweight: FontWeight.w400,
                textcolor: Color(0xff202020),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextInputField(
            height: 40,
            controller: courseNameController,
            onChanged: (p0) {
              coursesTitle = p0!;
            },
          ),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.only(left: 24, bottom: 4),
          child: Row(
            children: [
              TextComponent(
                "Ecrivez des détails à partager avec le livreur",
                fontsize: 14,
                fontweight: FontWeight.w400,
                textcolor: Color(0xff202020),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextInputField(
            height: 119,
            controller: courseDescriptionController,
            onChanged: (p0) {
              coursesDescription = p0!;
            },
          ),
        ),
        const SizedBox(height: 16),
        if (!isSmallScreen) const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isNarrow = constraints.maxWidth < 400;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonDeliveryComponent(
                      height: 40,
                      width: isNarrow ? constraints.maxWidth / 2 - 55 : 240,
                      "Livraison Express",
                      onPressed: onDeliveryPressed,
                    ),
                    ButtonNextComponent(
                      height: 40,
                      width: isNarrow ? constraints.maxWidth / 3  : 240,
                      "continuer",
                      onPressed: onPressed,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
