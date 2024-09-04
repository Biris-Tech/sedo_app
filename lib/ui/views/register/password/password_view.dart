import 'package:flutter/material.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/models/otp.dart';
import 'package:sedo_app/models/register.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/button_component.dart';
import 'package:sedo_app/ui/common/input_component.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'password_viewmodel.dart';
import 'package:sedo_app/ui/views/register/password/password_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'password'),
  FormTextField(name: 'confirmPassword'),
])
class PasswordView extends StackedView<PasswordViewModel> with $PasswordView {
  const PasswordView({super.key});

  @override
  Widget builder(
    BuildContext context,
    PasswordViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: viewModel.isBusy
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kcPrimaryColor),
              ),
            )
          : SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: screenHeight(context) <= 850 ? 100 : 140),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 68, bottom: 16),
                    child: Row(
                      children: [
                        Text(
                          "Créer un compte",
                          style: TextStyle(
                            fontSize: getResponsiveMassiveFontSize(context),
                            fontWeight: FontWeight.w700,
                            color: kcPrimaryColorDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, bottom: 4),
                    child: Row(
                      children: [
                        Text(
                          "Mot de passe",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: kcPrimaryColorDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextInputField(
                      height: 40,
                      controller: passwordController,
                      onChanged: (value) => viewModel.checkAllInputFull(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          viewModel.passwordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: kcPrimaryColorDark.withOpacity(0.5),
                        ),
                        onPressed: () => viewModel.obscurePassword(),
                      ),
                      obscureText: !viewModel.passwordVisible,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, bottom: 4),
                    child: Row(
                      children: [
                        Text(
                          "Confirmer le mot de passe",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: kcPrimaryColorDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextInputField(
                      height: 40,
                      controller: confirmPasswordController,
                      onChanged: (value) => viewModel.checkAllInputFull(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          viewModel.confirmVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: kcPrimaryColorDark.withOpacity(0.5),
                        ),
                        onPressed: () => viewModel.obscureConfirmPassword(),
                      ),
                      obscureText: !viewModel.confirmVisible,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextComponent(
                        "Vous avez déjà un compte ?",
                        fontsize: 12,
                        fontweight: FontWeight.w400,
                      ),
                      TextButton(
                        onPressed: () {
                          viewModel.goBackToLogin();
                        },
                        child: const TextComponent(
                          "Connectez-vous",
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
                   SizedBox(height: screenHeight(context) * 0.22),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonBackComponent("Etape précédente", onPressed: () {
                            viewModel.goBackToRegister();
                          }),
                          ButtonComponent(
                            "Continuer",
                            isfull: viewModel.allInputFull,
                            onPressed: () async {
                              final user = Register(
                                name: userName,
                                surname: userSurname,
                                email: userEmail,
                                number: userPhone,
                                password: passwordController.text,
                              );
                              Otp otp = Otp(email: userEmail, typeOfVerification: "email");
                              await viewModel.register(user, otp);
                            },
                            width: 150,
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
          ),
    );
  }

  @override
  void onViewModelReady(PasswordViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  PasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PasswordViewModel();
}
