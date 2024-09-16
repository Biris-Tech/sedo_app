import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sedo_app/models/app_image_constants.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/views/home/profile/profile_viewmodel.dart';

import '../../../../common/text_components.dart';
import '../../../../common/ui_helpers.dart';

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
  late String _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.itemValue;
  }

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
                _currentValue,
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
        String editedValue = _currentValue;

        return AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: const EdgeInsets.all(20),
          title: Text(
            "Modifier ${widget.itemName}",
            style: const TextStyle(fontSize: 16),
          ),
          content: TextField(
            onSubmitted: (value) {
              editedValue = value;
            },
            controller: TextEditingController(text: _currentValue),
            decoration: InputDecoration(
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
                setState(() {
                  _currentValue = editedValue;
                });
                widget.onChanged(editedValue); // Notify the parent widget of the change
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
