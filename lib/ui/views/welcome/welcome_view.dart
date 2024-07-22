import 'package:flutter/material.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/button_component.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'welcome_viewmodel.dart';

class WelcomeView extends StackedView<WelcomeViewModel> {
  const WelcomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    WelcomeViewModel viewModel,
    Widget? child,
  ) {
    final isSmallScreen = MediaQuery.of(context).size.height <= 820;
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: Colors.white,
      body: isSmallScreen
          ? SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: isSmallScreen ? 100 : 160),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/sedologo.png',
                        height: 45,
                        color: kcPrimaryColor,
                      ),
                    ],
                  ),
                  SizedBox(height: isSmallScreen ? 120 : 140),
                  SizedBox(
                    width: screenWidth(context) - 20,
                    height: 260,
                    child: Image.asset(
                      'assets/welcomeimg.png',
                      height: 260,
                      fit: BoxFit.fill,
                    ),
                  ),
                  verticalSpaceLarge,
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextComponent(
                          "Bienvenue sur ",
                          fontsize: 24,
                          fontweight: FontWeight.bold,
                          textcolor: kcPrimaryColorDark,
                        ),
                        TextComponent(
                          "Sedo",
                          fontsize: 24,
                          fontweight: FontWeight.bold,
                          textcolor: kcPrimaryColor,
                        ),
                        TextComponent(
                          ",le",
                          fontsize: 24,
                          fontweight: FontWeight.bold,
                          textcolor: kcPrimaryColorDark,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        TextComponent(
                          "partenaire ideal pour toutes\nvos livraisons.",
                          textcolor: kcPrimaryColorDark,
                          fontsize: 24,
                          fontweight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                  verticalSpaceLarge,
                  Padding(
                    padding: const EdgeInsets.only(right: 16, bottom: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: ButtonComponent(
                            height: 24,
                            "Continuer",
                            onPressed: () {
                              viewModel.navigateToRegister();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                SizedBox(height: isSmallScreen ? 100 : 160),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/sedologo.png',
                      height: 45,
                      color: kcPrimaryColor,
                    ),
                  ],
                ),
                SizedBox(height: isSmallScreen ? 120 : 140),
                SizedBox(
                  width: screenWidth(context) - 20,
                  height: 260,
                  child: Image.asset(
                    'assets/welcomeimg.png',
                    height: 260,
                    fit: BoxFit.fill,
                  ),
                ),
                verticalSpaceLarge,
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextComponent(
                        "Bienvenue sur ",
                        fontsize: 24,
                        fontweight: FontWeight.bold,
                        textcolor: kcPrimaryColorDark,
                      ),
                      TextComponent(
                        "Sedo",
                        fontsize: 24,
                        fontweight: FontWeight.bold,
                        textcolor: kcPrimaryColor,
                      ),
                      TextComponent(
                        ",le",
                        fontsize: 24,
                        fontweight: FontWeight.bold,
                        textcolor: kcPrimaryColorDark,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      TextComponent(
                        "partenaire ideal pour toutes\nvos livraisons.",
                        textcolor: kcPrimaryColorDark,
                        fontsize: 24,
                        fontweight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
                const Expanded(child: verticalSpaceLarge),
                Padding(
                  padding: const EdgeInsets.only(right: 16, bottom: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: ButtonComponent(
                          height: 24,
                          "Continuer",
                          onPressed: () {
                            viewModel.navigateToRegister();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  @override
  WelcomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WelcomeViewModel();
}
