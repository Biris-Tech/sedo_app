import 'package:flutter/material.dart';
import '../../../../common/ui_helpers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/text_components.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/models/app_image_constants.dart';

class ProfileItem extends StatefulWidget {
  const ProfileItem(
      {super.key,
      required this.itemName,
      required this.itemValue,
      required this.onChanged});

  final String itemName;
  final String itemValue;
  final ValueChanged<String> onChanged;

  @override
  _ProfileItemState createState() => _ProfileItemState();
}
class _ProfileItemState extends State<ProfileItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextComponent(
                widget.itemName,
                fontweight: FontWeight.w500,
                fontsize: getResponsiveFontSize(context, max: 15),
                textcolor: const Color(0xFF150B3D),
              ),
              verticalSpaceSmall,
              TextComponent(
                widget.itemValue,  // Directement à partir de widget.itemValue
                fontweight: FontWeight.w400,
                fontsize: getResponsiveFontSize(context, max: 12),
                textcolor: const Color(0xFF150B3D).withOpacity(0.4),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              _editItemValue(context);
            },
            child: SvgPicture.asset(AppImageConstants.pen2),
          ),
        ],
      ),
    );
  }

  void _editItemValue(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String editedValue = widget.itemValue; // Utiliser widget.itemValue

        return AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: const EdgeInsets.all(20),
          title: Text(
            "Modifier ${widget.itemName}",
            style: const TextStyle(fontSize: 16),
          ),
          content: TextField(
            onChanged: (value) {
              editedValue = value;
            },
            controller: TextEditingController(text: widget.itemValue),
            decoration: const InputDecoration(
              labelText: 'Nouvelle valeur',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kcPrimaryColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kcPrimaryColor),
              ),
            ),
            cursorColor: kcPrimaryColor,
          ),
          actions: <Widget>[
            TextButton(
              child: const TextComponent(
                'Annuler',
                textcolor: kcPrimaryColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const TextComponent(
                'Sauvegarder',
                textcolor: kcPrimaryColor,
              ),
              onPressed: () {
                widget.onChanged(editedValue); // Mise à jour via le parent
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}