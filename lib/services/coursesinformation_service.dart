import 'package:flutter/material.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/ui/common/button_component.dart';
import 'package:sedo_app/ui/common/input_component.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';

class CoursesinformationService {
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseDescriptionController = TextEditingController();

  Future bottomSheetCoursesInfo(BuildContext context,
      Function()? onDeliveryPressed, Function()? onPressed, bool isLoading) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: screenHeight(context) * 0.85,
          child: buildContent(context, onDeliveryPressed, onPressed, isLoading),
        );
      },
    );
  }

  Widget buildContent(BuildContext context, Function()? onDeliveryPressed,
      Function()? onPressed, bool isLoading) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      goBack();
                    },
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
                  Flexible(
                    child: TextComponent(
                      "prions d’ajouter un titre à votre course. Ajoutez plus de détails pour donner plus d’informations sur votre course au livreur.",
                      fontsize: 14,
                      fontweight: FontWeight.w400,
                      textcolor: const Color(0xff202020).withOpacity(0.5),
                    ),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonNext1Component(
                      height: 40,
                      width: screenWidth(context) * 0.7,
                      "continuer",
                      onPressed: onPressed,
                      // isfull: isLoading,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
