import 'package:flutter/material.dart';
import 'package:sedo_app/models/otp.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/button_component.dart';
import 'package:sedo_app/ui/common/input_component.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';
import 'package:sedo_app/ui/views/otp/otp_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'otp_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'otp1'),
  FormTextField(name: 'otp2'),
  FormTextField(name: 'otp3'),
  FormTextField(name: 'otp4'),
])
class OtpView extends StackedView<OtpViewModel> with $OtpView {
  const OtpView({super.key});

  @override
  Widget builder(
    BuildContext context,
    OtpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: viewModel.isBusy
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kcPrimaryColor),
              ),
            )
          : Column(
              children: [
                SizedBox(height: screenHeight(context) <= 850 ? 100 : 160),
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
                const Padding(
                  padding: EdgeInsets.only(left: 16, top: 72, bottom: 8),
                  child: Row(
                    children: [
                      TextComponent(
                        "Vérifier vos SMS",
                        fontsize: 30,
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
                        "Nous avons envoyé un code de confirmation au numéro",
                        fontsize: 13,
                        fontweight: FontWeight.w600,
                        textcolor: kcInputBordersColors,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      TextComponent(
                        "90111000.",
                        fontsize: 13,
                        fontweight: FontWeight.w600,
                        textcolor: kcInputBordersColors,
                      ),
                    ],
                  ),
                ),
                verticalSpaceLarge,
                Image.asset(
                  'assets/otpimg.png',
                  height: 109,
                  width: 125,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextInputField(
                        height: 75,
                        width: 75,
                        controller: otp1Controller,
                        keyboardType: TextInputType.number,
                        focusNode: otp1FocusNode,
                        onChanged: (value) {
                          viewModel.checkAllInputFull();
                          if (value!.length == 1) {
                            FocusScope.of(context).requestFocus(otp2FocusNode);
                          }
                        },
                      ),
                      const SizedBox(width: 16),
                      TextInputField(
                        height: 75,
                        width: 75,
                        controller: otp2Controller,
                        keyboardType: TextInputType.number,
                        focusNode: otp2FocusNode,
                        onChanged: (value) {
                          viewModel.checkAllInputFull();
                          if (value!.length == 1) {
                            FocusScope.of(context).requestFocus(otp3FocusNode);
                          }
                        },
                      ),
                      const SizedBox(width: 16),
                      TextInputField(
                        height: 75,
                        width: 75,
                        controller: otp3Controller,
                        keyboardType: TextInputType.number,
                        focusNode: otp3FocusNode,
                        onChanged: (value) {
                          viewModel.checkAllInputFull();
                          if (value!.length == 1) {
                            FocusScope.of(context).requestFocus(otp4FocusNode);
                          }
                        },
                      ),
                      const SizedBox(width: 16),
                      TextInputField(
                        height: 75,
                        width: 75,
                        controller: otp4Controller,
                        keyboardType: TextInputType.number,
                        focusNode: otp4FocusNode,
                        onChanged: (value) {
                          Otp otp = Otp(
                            typeOfVerification: "email",
                            code: (otp1Controller.text +
                                otp2Controller.text +
                                otp3Controller.text +
                                otp4Controller.text),
                          );
                          viewModel.checkAllInputFull(otp: otp);
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextComponent(
                      "Vous n'avez reçu aucun code ?",
                      fontsize: 12,
                      fontweight: FontWeight.w400,
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const TextComponent(
                        "Renvoyer le code",
                        fontsize: 12,
                        fontweight: FontWeight.w700,
                        textcolor: kcPrimaryColor,
                        decoration: TextDecoration.underline,
                        decorationcolor: kcPrimaryColor,
                        decorationthinkness: 2,
                      ),
                    )
                  ],
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonBackComponent("Etape précédente", onPressed: () {
                          viewModel.goBackToRegister();
                        }),
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }

  @override
  void onViewModelReady(OtpViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  OtpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtpViewModel();
}
