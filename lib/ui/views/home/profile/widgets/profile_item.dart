import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sedo_app/models/app_image_constants.dart';

import '../../../../common/text_components.dart';
import '../../../../common/ui_helpers.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {super.key, required this.itemName, required this.itemValue});

  final String itemName;
  final String itemValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextComponent(
                itemName,
                fontweight: FontWeight.w500,
                fontsize: getResponsiveFontSize(context, max: 15),
                textcolor: Color(0xFF150B3D),
              ),
              verticalSpaceSmall,
              TextComponent(
                itemValue,
                fontweight: FontWeight.w400,
                fontsize: getResponsiveFontSize(context, max: 12),
                textcolor: Color(0xFF150B3D).withOpacity(0.4),
              ),
            ],
          ),
          SvgPicture.asset(AppImageConstants.pen2)
        ],
      ),
    );
  }
}
