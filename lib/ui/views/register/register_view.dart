import 'package:flutter/material.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/button_component.dart';
import 'package:sedo_app/ui/common/input_component.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';
import 'package:sedo_app/ui/views/register/register_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'register_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'name'),
  FormTextField(name: 'surname'),
  FormTextField(name: 'email'),
  FormTextField(name: 'phone'),
])
class RegisterView extends StackedView<RegisterViewModel> with $RegisterView {
  const RegisterView({super.key});

  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
    Widget? child,
  ) {
    final isSmallScreen = MediaQuery.of(context).size.height <= 850;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: isSmallScreen
          ? SingleChildScrollView(
              child: buildContent(context, viewModel),
            )
          : buildContent(context, viewModel),
    );
  }

  Widget buildContent(BuildContext context, RegisterViewModel viewModel) {
    final isSmallScreen = MediaQuery.of(context).size.height <= 850;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: isSmallScreen ? 100 : 140),
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
          padding: const EdgeInsets.only(left: 16, top: 62, bottom: 16),
          child: Row(
            children: [
              TextComponent(
                "Créer un compte",
                fontsize: getResponsiveMassiveFontSize(context),
                fontweight: FontWeight.w700,
                textcolor: kcPrimaryColorDark,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24, bottom: 4),
          child: Row(
            children: [
              TextComponent(
                "Nom",
                fontsize: 14,
                textcolor: kcInputBordersColors,
                fontweight: FontWeight.w700,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextInputField(
            controller: nameController,
            height: 40,
            hintText: "ex: John",
            onChanged: (value) => viewModel.checkAllInputFull(),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24, bottom: 12),
          child: Row(
            children: [
              TextComponent(
                "Prénom",
                fontsize: 14,
                textcolor: kcInputBordersColors,
                fontweight: FontWeight.w700,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextInputField(
            hintText: "ex: Doe",
            height: 40,
            controller: surnameController,
            onChanged: (value) => viewModel.checkAllInputFull(),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24, bottom: 4, top: 12),
          child: Row(
            children: [
              TextComponent(
                "Email",
                fontsize: 14,
                textcolor: kcInputBordersColors,
                fontweight: FontWeight.w700,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextInputField(
            height: 40,
            hintText: "ex: jonhdoe@gmail.com",
            controller: emailController,
            onChanged: (value) => viewModel.checkAllInputFull(),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24, bottom: 12, top: 4),
          child: Row(
            children: [
              TextComponent(
                "Numéro de téléphone",
                fontsize: 14,
                textcolor: kcInputBordersColors,
                fontweight: FontWeight.w700,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextInputField(
            height: 40,
            controller: phoneController,
            hintText: "ex: +225 00 00 00 00",
            onChanged: (value) => viewModel.checkAllInputFull(),
          ),
        ),
        const SizedBox(height: 8),
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
                viewModel.goToLoginView();
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
        if (!isSmallScreen) const Expanded(child: verticalSpaceLarge),
        Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              SizedBox(
                width: 184,
                height: 40,
                child: ButtonComponent(
                  "Etape suivante",
                  isfull: viewModel.allInputFull,
                  onPressed: () {
                    userName = nameController.text;
                    userSurname = surnameController.text;
                    userEmail = emailController.text;
                    userPhone = phoneController.text;
                    viewModel.navigateToPassword();
                  },
                  width: double.infinity,
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void onViewModelReady(RegisterViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  RegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterViewModel();
}
