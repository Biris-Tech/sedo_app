import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sedo_app/models/app_image_constants.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import '../../../common/text_components.dart';
import '../../../common/ui_helpers.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding:
            const EdgeInsets.only(top: kToolbarHeight, left: 25.0, right: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextComponent(
                "Profil",
                fontweight: FontWeight.bold,
                fontsize: getResponsiveFontSize(context, max: 18),
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
                          height: 65,
                          width: 65,
                          child: Center(
                              child: Icon(
                            Icons.person,
                            color: kcTextGreyColor.withOpacity(0.5),
                            size: 50,
                          )),
                        ),
                        horizontalSpaceMedium,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: screenWidth(context) * 0.4,
                              child: TextComponent(
                                "${viewModel.firstname} ${viewModel.lastname[0]}.",
                                textcolor: kcTextGreyColor,
                                fontsize: 18,
                                fontweight: FontWeight.w700,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
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
                    GestureDetector(
                      onTap: () => viewModel.goToUpdateProfileView(),
                      child: SvgPicture.asset(
                        AppImageConstants.blackPen,
                        height: 25,
                        width: 25,
                      ),
                    )
                  ],
                ),
              ),
              verticalSpaceLarge,
              Center(
                  child: SvgPicture.asset(
                AppImageConstants.profileImg,
              )),
              verticalSpaceLarge,
              GestureDetector(
                onTap: () => viewModel.goToCourseHistoricView(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.history,
                            color: kcTextGreyColor.withOpacity(0.7)),
                        horizontalSpaceSmall,
                        TextComponent(
                          "Historique de mes courses",
                          fontsize: 14,
                          fontweight: FontWeight.w400,
                          textcolor: kcTextGreyColor.withOpacity(0.7),
                        )
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: kcTextGreyColor.withOpacity(0.7),
                      size: 20,
                    )
                  ],
                ),
              ),
              verticalSpaceMedium,
              GestureDetector(
                onTap: () => viewModel.goToAccountSettingView(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: kcTextGreyColor.withOpacity(0.7),
                        ),
                        horizontalSpaceSmall,
                        TextComponent(
                          "Parametres du compte",
                          fontsize: 14,
                          fontweight: FontWeight.w400,
                          textcolor: kcTextGreyColor.withOpacity(0.7),
                        )
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: kcTextGreyColor.withOpacity(0.7),
                      size: 20,
                    )
                  ],
                ),
              ),
              verticalSpaceMedium,
              InkWell(
                onTap: () {
                  viewModel.disconectUser();
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Color(0xFFEA1C24),
                    ),
                    horizontalSpaceSmall,
                    TextComponent(
                      "Déconnexion",
                      fontsize: 14,
                      fontweight: FontWeight.w400,
                      textcolor: Color(0xFFEA1C24),
                    )
                  ],
                ),
              ),
              verticalSpaceLarge,
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
