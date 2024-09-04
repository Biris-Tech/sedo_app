import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';

class TextInputField extends StatefulWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? label;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool obscureText;
  final bool isEmail;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final String? hintText;
  final Widget? suffixIcon;
  final String? suffixText;
  final bool enabled;
  final AutovalidateMode autovalidate;
  final bool readOnly;
  final bool autofocus;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;

  final Function()? onTap;

  const TextInputField({
    super.key,
    this.label,
    this.controller,
    this.validator,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.obscureText = false,
    this.isEmail = false,
    this.onSaved,
    this.hintText,
    this.suffixIcon,
    this.suffixText,
    this.autovalidate = AutovalidateMode.onUserInteraction,
    this.autofocus = false,
    this.enabled = true,
    this.readOnly = false,
    this.initialValue,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.focusNode,
    this.maxLines = 1,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const inputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
    return Container(
        width: widget.width,
        padding: widget.padding,
        height: widget.height,
        margin: widget.margin,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(widget.height == screenHeight(context) * 0.10 ? 16 : 24),
          border: Border.all(
            color: kcInputBordersColors.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        child: Center(
          child: TextFormField(
            cursorColor: kcPrimaryColor,
            maxLines: widget.maxLines,
            focusNode: focusNode,
            readOnly: widget.readOnly,
            initialValue: widget.initialValue,
            autofocus: widget.autofocus,
            autovalidateMode: widget.autovalidate,
            obscureText: widget.obscureText,
            inputFormatters: widget.inputFormatters,
            textAlign: widget.height == screenHeight(context) * 0.10 ? TextAlign.center : TextAlign.start,
            decoration: InputDecoration(
              labelText: widget.label,
              // labelStyle: const TextStyle(color: primColor, fontWeight: FontWeight.w500),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: widget.hintText ?? (widget.enabled ? null : 'N/A'),
              hintStyle: const TextStyle(
                  //  color: inputBorderColor.withOpacity(0.55),
                  ),
              suffixIcon: widget.suffixIcon,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              focusedBorder: inputBorder,
              enabledBorder: inputBorder,
              disabledBorder: InputBorder.none,
              enabled: widget.enabled,
            ),
            style: TextStyle(
              color: widget.enabled ? Colors.black : Colors.black45,
              fontSize: widget.height == 75 ? 24 : 16,
            ),
            controller: widget.controller,
            validator: widget.enabled ? widget.validator : null,
            onSaved: widget.onSaved,
            keyboardType: widget.keyboardType,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            //maxLength: widget.height == 75 ? 1 : null,
          ),
        ));
  }
}
