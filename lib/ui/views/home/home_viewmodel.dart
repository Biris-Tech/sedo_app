import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:sedo_app/app/app.dialogs.dart';
import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/app/app.bottomsheets.dart';
import 'package:sedo_app/ui/common/app_strings.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sedo_app/ui/views/home/courier/courier_view.dart';
import 'package:sedo_app/ui/views/home/profile/profile_view.dart';
import 'package:sedo_app/ui/views/home/reception/reception_view.dart';
import 'package:sedo_app/ui/views/home/notifications/notifications_view.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  Widget getViewFromIndex(int index) {
    switch (index) {
      case 0:
        return const ReceptionView();
      case 1:
        return const CourierView();
      case 2:
        return const NotificationsView();
      case 3:
        return const ProfileView();
     
      default:
        return const ReceptionView();
    }
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
