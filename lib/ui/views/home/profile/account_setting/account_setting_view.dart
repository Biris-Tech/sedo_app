import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sedo_app/models/app_image_constants.dart';
import 'package:sedo_app/ui/views/home/profile/account_setting/account_setting_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../common/app_colors.dart';
import '../../../../common/text_components.dart';
import '../../../../common/ui_helpers.dart';



class AccountSettingView extends StackedView<AccountSettingViewModel>  {
  const AccountSettingView({super.key});

  @override
  Widget builder(
      BuildContext context,
      AccountSettingViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: kToolbarHeight,left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 20
              ),
              child: Row(
                children: [
                   GestureDetector(
                     onTap: () {
                       goBack();
                     },
                       child: const Icon(Icons.keyboard_backspace)
                   ),
                  horizontalSpaceSmall,
                  TextComponent(
                    "Paramètre du compte",
                    fontweight: FontWeight.bold,
                    fontsize: getResponsiveFontSize(context, max: 18),
                  ),
                ],
              ),
            ),
            verticalSpaceSmall,
            GestureDetector(
             onTap: () => viewModel.goToSetNotificationView(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.notifications,
                          color: kcTextGreyColor.withOpacity(0.7)),
                      horizontalSpaceSmall,
                      TextComponent(
                        "Notifications",
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
              onTap: () {
                final  dialog = DialogResponse(

                );
                 //InfoAlertDialog(request: dialog, completer: completer)
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                          AppImageConstants.deleteIcon,
                          height: 18, width: 24),
                      horizontalSpaceSmall,
                      const TextComponent(
                        "Supprimer le compte",
                        fontsize: 14,
                        fontweight: FontWeight.w400,
                        textcolor: Color(0xFFEA1C24),
                      )
                    ],
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
  AccountSettingViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      AccountSettingViewModel();
}
