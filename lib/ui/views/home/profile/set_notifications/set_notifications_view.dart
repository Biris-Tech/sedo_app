import 'package:flutter/material.dart';

import 'package:sedo_app/models/app_image_constants.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';
import 'package:sedo_app/ui/views/home/profile/set_notifications/set_notifications_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SetNotificationView extends StackedView<SetNotificationViewModel> {
  const SetNotificationView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SetNotificationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: kToolbarHeight, left: 25.0, right: 25.0),
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
                    "Paramètre du compte",
                    fontweight: FontWeight.bold,
                    fontsize: getResponsiveFontSize(context, max: 18),
                  ),
                ],
              ),
            ),
            verticalSpaceMedium,
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextComponent(
                    "Alerte du statut de la course",
                    fontsize: 14,
                    fontweight: FontWeight.w400,
                    textcolor: kcTextGreyColor.withOpacity(0.7),
                  ),
                  Switch(
                    activeColor: kcPrimaryColor,
                    value: viewModel.deliveryNotificationIsActive,
                    onChanged: (state) {
                      viewModel.toggleDeliveryNotificationStatus(state);
                    },
                    activeThumbImage: const Image(
                      image: AssetImage(AppImageConstants.activeSwitchIcon),
                      height: 30,
                    ).image,
                  ),
                ],
              ),
            ),
            verticalSpaceMedium,
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextComponent(
                    "Alerte coursier arrivé",
                    fontsize: 14,
                    fontweight: FontWeight.w400,
                    textcolor: kcTextGreyColor.withOpacity(0.7),
                  ),
                  Switch(
                    activeColor: kcPrimaryColor,
                    value: viewModel.dpIsComingIsComingAlert,
                    onChanged: (state) {
                      viewModel.toggleDpIsComingIsComingAlert(state);
                    },
                    activeThumbImage: const Image(
                      image: AssetImage(AppImageConstants.activeSwitchIcon),
                      height: 30,
                    ).image,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SetNotificationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SetNotificationViewModel();
}
