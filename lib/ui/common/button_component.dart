import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';

class ButtonComponent extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final bool? isfull;
  const ButtonComponent(
    this.text, {
    super.key,
    this.onPressed,
    this.buttonColor,
    this.textColor,
    this.width,
    this.height,
    this.fontSize,
    this.isfull,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(kcPrimaryColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          //elevation: WidgetStateProperty.all(elevation),

          // side: WidgetStateProperty.all(
          //   BorderSide(
          //     color: borderColor!,
          //     width: borderWidth!,
          //   ),
          // ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
            TextComponent(
              text,
              fontweight: FontWeight.w200,
              fontsize: screenWidth(context) * 0.04,
              textcolor: Colors.white,
            ),
             SizedBox(width: screenWidth(context) * 0.02),
             Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: kcPrimaryColor,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 12,
                    ),
                  )),
            
          ],
        ),
      ),
      if (isfull == false)
        Positioned.fill(
            child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(24),
          ),
        )),
    ]);
  }
}

class ButtonBackComponent extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final bool? isfull;
  const ButtonBackComponent(
    this.text, {
    super.key,
    this.onPressed,
    this.buttonColor,
    this.textColor,
    this.width,
    this.height,
    this.fontSize,
    this.isfull,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          //elevation: WidgetStateProperty.all(elevation),

          side: WidgetStateProperty.all(
            const BorderSide(
              color: kcPrimaryColor,
              width: 1.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                  padding: const EdgeInsets.only(left: 4),
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: kcPrimaryColor,
                      width: 1.5,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: kcPrimaryColor,
                      size: 12,
                    ),
                  )),
            ),
            TextComponent(
              text,
              fontweight: FontWeight.w600,
              fontsize: screenWidth(context) * 0.03,
              textcolor: kcPrimaryColor,
            ),
          ],
        ),
      ),
    ]);
  }
}

class ButtonNextComponent extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final bool? isfull;
  const ButtonNextComponent(
    this.text, {
    super.key,
    this.onPressed,
    this.buttonColor,
    this.textColor,
    this.width,
    this.height,
    this.fontSize,
    this.isfull,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double buttonWidth = width ?? constraints.maxWidth;
        if (constraints.maxWidth < 400) {
          buttonWidth =
              constraints.maxWidth / 2 - 10; // Adjusted for small screens
        }
        return Stack(
          children: [
            ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(buttonColor ?? kcPrimaryColor),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              child: SizedBox(
                height: height ?? 40,
                width: width,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextComponent(
                        text,
                        fontweight: FontWeight.w600,
                        fontsize: fontSize ?? 16,
                        textcolor: textColor ?? Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: kcPrimaryColor,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.5,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (isfull == false)
              Positioned.fill(
                child: Container(
                  height: height ?? 40,
                  width: buttonWidth,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class ButtonDeliveryComponent extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final bool? isfull;
  const ButtonDeliveryComponent(
    this.text, {
    super.key,
    this.onPressed,
    this.buttonColor,
    this.textColor,
    this.width,
    this.height,
    this.fontSize,
    this.isfull,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double buttonWidth = width ?? constraints.maxWidth;
        if (constraints.maxWidth < 400) {
          buttonWidth =
              constraints.maxWidth / 2 - 10; // Adjusted for small screens
        }
        return Stack(
          children: [
            ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(buttonColor ?? KcGreenColor),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              child: SizedBox(
                height: height ?? 40,
                width: buttonWidth,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextComponent(
                        text,
                        fontweight: FontWeight.w600,
                        fontsize: fontSize ?? 16,
                        textcolor: textColor ?? Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/StarFall.svg",
                              fit: BoxFit.cover,
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (isfull == false)
              Positioned.fill(
                child: Container(
                  height: height ?? 40,
                  width: buttonWidth,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class ButtonTrueComponent extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final bool? isfull;
  const ButtonTrueComponent(
    this.text, {
    super.key,
    required this.onPressed,
    this.buttonColor,
    this.textColor,
    this.width,
    this.height,
    this.fontSize,
    this.isfull,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: const BorderSide(color: kcPrimaryColor)),
          ),
        ),
        child: SizedBox(
          height: height,
          width: width,
          child: Center(
            child: TextComponent(
              text,
              fontweight: FontWeight.w600,
              fontsize: 14,
              textcolor: kcPrimaryColor,
            ),
          ),
        ),
      ),
    ]);
  }
}

Container buttonSimple(double height, double width, String text) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        gradient: linearcolor3, borderRadius: BorderRadius.circular(24)),
    child: Center(
      child: TextComponent(
        text,
        fontsize: 14,
        textcolor: Colors.white,
        fontweight: FontWeight.w600,
      ),
    ),
  );
}
