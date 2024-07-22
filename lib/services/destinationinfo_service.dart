import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/ui/common/button_component.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';
import 'package:sedo_app/ui/views/home/courier/courier_view.form.dart';
import 'package:sedo_app/ui/views/home/courier/courier_viewmodel.dart';

class DestinationinfoService with $CourierView {
  Future bottomSheetDestinationAdressInfo(
    BuildContext context,
    CourierViewModel model,
    Function()? onTap,
  ) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      context: context,
      builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.height <= 850;
        return SizedBox(
          height: screenHeight(context) - 435,
          child: isSmallScreen
              ? SingleChildScrollView(
                  child: buildContent(context, model, onTap),
                )
              : buildContent(context, model, onTap),
        );
      },
    );
  }

  Widget buildContent(
      BuildContext context, CourierViewModel model, Function()? onTap) {
    final isSmallScreen = MediaQuery.of(context).size.height <= 850;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              FaIcon(
                Icons.location_on_sharp,
                color: Color(0xFF8C034E),
              ),
              SizedBox(width: 3),
              TextComponent(
                "Adresse de destination",
                fontweight: FontWeight.w700,
                fontsize: 18,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Row(
            children: [
              TextComponent(
                "Lieu",
                fontweight: FontWeight.w500,
                fontsize: 14,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 40,
            width: screenWidth(context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFB7B7B7)),
            ),
            child: TextComponent(model.destinationName),
          ),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Row(
            children: [
              TextComponent(
                "Personne à contacter au point de départ",
                fontweight: FontWeight.w500,
                fontsize: 14,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 60,
            child: IntlPhoneField(
              controller: destinationnumController,
              onChanged: (val) {
                destinationPhone = val.completeNumber;
                print("dest: $destinationPhone");
              },
              decoration: InputDecoration(
                labelText: '90100100',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFB7B7B7)),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              initialCountryCode: 'BJ',
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Row(
            children: [
              TextComponent(
                "Le livreur pourra vous contacter avec ce numéro.",
                fontweight: FontWeight.w500,
                fontsize: 10,
              ),
            ],
          ),
        ),
        if (!isSmallScreen) const Expanded(child: SizedBox()),
        
        const SizedBox(height: 16),
       
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                InkWell(
                  onTap: () {
                    destinationPhone = destinationnumController.text;
                    print("dest: $destinationPhone");
                  },
                  child: ButtonNextComponent(
                    height: 48,
                    "suivant",
                    isfull: model.allInputFull,
                    onPressed: onTap,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
