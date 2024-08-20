import 'package:flutter/material.dart';
import 'package:sedo_app/models/login.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/button_component.dart';
import 'package:sedo_app/ui/common/input_component.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';
import 'package:sedo_app/ui/views/login/login_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'phoneOrEmail'),
  FormTextField(name: 'password'),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
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
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 78, bottom: 16),
                  child: Row(
                    children: [
                      Text(
                        "Connexion",
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
                        "Numéro de téléphone où email",
                        style: TextStyle(
                            fontSize: 14,
                            color: kcPrimaryColorDark,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextInputField(
                    height: 40,
                    controller: phoneOrEmailController,
                    onChanged: (value) => viewModel.checkAllInputFull(),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 24, bottom: 4),
                  child: Row(
                    children: [
                      Text(
                        "Mot de passée",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextComponent(
                      "Vous n'avez pas de compte ?",
                      fontsize: 12,
                      fontweight: FontWeight.w400,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    TextButton(
                      onPressed: () {
                        viewModel.goToRegister();
                      },
                      child: const TextComponent(
                        "Inscrivez-vous",
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
                        const SizedBox(),
                        ButtonComponent(
                          "Etape suivante",
                          isfull: viewModel.allInputFull,
                          onPressed: () async {
                            Login user = Login(
                              email: phoneOrEmailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                            await viewModel.fetchLogin(user);
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
    );
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
