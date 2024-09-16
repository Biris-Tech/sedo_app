import 'package:flutter/material.dart';
import 'package:sedo_app/models/user.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/button_component.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';
import 'package:sedo_app/ui/views/home/profile/profile_viewmodel.dart';
import 'package:sedo_app/ui/views/home/profile/update_profil/update_profil_viewmodel.dart';
import 'package:sedo_app/ui/views/home/profile/widgets/profile_item.dart';
import 'package:stacked/stacked.dart';

class UpdateProfileView extends StackedView<ProfileViewModel> {
  const UpdateProfileView({super.key});

  @override
Widget builder(
  BuildContext context,
  ProfileViewModel viewModel,
  Widget? child,
) {
  if (viewModel.isLoading) {
    return Center(child: CircularProgressIndicator());  // Indicateur de chargement
  }

  return Scaffold(
    backgroundColor: const Color(0xFFF1F3F7),
    body: Container(
      padding: const EdgeInsets.only(top: kToolbarHeight, left: 25.0, right: 25.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        goBack();
                      },
                      child: const Icon(Icons.keyboard_backspace)),
                  horizontalSpaceSmall,
                  TextComponent(
                    "Modifier profil",
                    fontweight: FontWeight.bold,
                    fontsize: getResponsiveFontSize(context, max: 18),
                  ),
                ],
              ),
            ),
            verticalSpaceMedium,
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: kcTextGreyColor.withOpacity(0.05)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: kcLightGrey.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(45)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(
                            Icons.person,
                            color: kcTextGreyColor.withOpacity(0.5),
                            size: 50,
                          ),
                        )),
                      ),
                      horizontalSpaceMedium,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: screenWidth(context) * 0.5,
                            child: TextComponent(
                              "${viewModel.lastname} ${viewModel.firstname}",
                              textcolor: kcTextGreyColor,
                              fontsize: 18,
                              fontweight: FontWeight.w700,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          TextComponent(
                            viewModel.accountCreatedAt,
                            textcolor: kcTextGreyColor.withOpacity(0.55),
                            fontsize: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Affiche les éléments une fois les données chargées
            verticalSpaceMedium,
            ProfileItem(
              itemName: 'Numero de téléphone',
              itemValue: viewModel.phone,
              onChanged: (newValue) {
                viewModel.setPhone(newValue); // Mets à jour dans le ViewModel
              },
            ),
            verticalSpaceSmall,
            ProfileItem(
              itemName: 'Email',
              itemValue: viewModel.email,
              onChanged: (newValue) {
                viewModel.setEmail(newValue);
              },
            ),
            verticalSpaceSmall,
            ProfileItem(
              itemName: 'Prenom',
              itemValue: viewModel.firstname,
              onChanged: (newValue) {
                viewModel.setFirstname(newValue);
              },
            ),
            verticalSpaceSmall,
            ProfileItem(
              itemName: 'Nom',
              itemValue: viewModel.lastname,
              onChanged: (newValue) {
                viewModel.setLastname(newValue);
              },
            ),
            SizedBox(height: screenHeight(context) * 0.05),
            ButtonTrueComponent(
              "Valider",
              onPressed: () async {
                UpdateProfileViewModel model = UpdateProfileViewModel();
                UserModel user = UserModel(
                  name: viewModel.firstname,
                  surname: viewModel.lastname,
                  email: viewModel.email,
                  phoneNumber: viewModel.phone,
                  roleId: 'USER',
                  password: "azerty",
                );
                await model.updateUser(user); // Appelle la fonction updateUser dans le ViewModel
              },
            ),
          ],
        ),
      ),
    ),
  );
}


  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
