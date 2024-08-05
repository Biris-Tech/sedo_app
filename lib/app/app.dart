import 'package:sedo_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:sedo_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:sedo_app/ui/views/home/home_view.dart';
import 'package:sedo_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sedo_app/ui/views/login/login_view.dart';
import 'package:sedo_app/ui/views/register/register_view.dart';
import 'package:sedo_app/ui/views/welcome/welcome_view.dart';
import 'package:sedo_app/ui/views/otp/otp_view.dart';
import 'package:sedo_app/ui/views/register/password/password_view.dart';
import 'package:sedo_app/services/login_service.dart';
import 'package:sedo_app/services/register_service.dart';
import 'package:sedo_app/services/otp_service.dart';
import 'package:sedo_app/ui/views/home/reception/reception_view.dart';
import 'package:sedo_app/ui/views/home/place/place_view.dart';
import 'package:sedo_app/ui/views/home/courier/courier_view.dart';
import 'package:sedo_app/ui/views/home/notifications/notifications_view.dart';
import 'package:sedo_app/ui/views/home/profile/profile_view.dart';
import 'package:sedo_app/services/location_service.dart';
import 'package:sedo_app/services/recoveryadress_service.dart';
import 'package:sedo_app/services/destinationadress_service.dart';
import 'package:sedo_app/services/coursesinformation_service.dart';
import 'package:sedo_app/services/billingoptions_service.dart';
import 'package:sedo_app/services/deliveryfinalization_service.dart';
import 'package:sedo_app/services/expressdelivery_service.dart';
import 'package:sedo_app/services/cardlist_service.dart';
import 'package:sedo_app/services/cardcreate_service.dart';
import 'package:sedo_app/services/numlist_service.dart';
import 'package:sedo_app/services/numcreate_service.dart';

import 'package:sedo_app/services/destinationinfo_service.dart';
import 'package:sedo_app/services/shippingproposal_service.dart';
import 'package:sedo_app/ui/views/home/profile/account_setting/account_setting_view.dart';
import 'package:sedo_app/ui/views/home/profile/set_notifications/set_notifications_view.dart';
import 'package:sedo_app/ui/views/home/profile/update_profil/update_profil_view.dart';
import 'package:sedo_app/ui/views/home/profile/historic_courses/historic_courses_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: WelcomeView),
    MaterialRoute(page: OtpView),
    MaterialRoute(page: PasswordView),
    MaterialRoute(page: ReceptionView),
    MaterialRoute(page: PlaceView),
    MaterialRoute(page: CourierView),
    MaterialRoute(page: NotificationsView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: AccountSettingView),
    MaterialRoute(page: SetNotificationView),
    MaterialRoute(page: UpdateProfileView),
    MaterialRoute(page: HistoricCoursesView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: LoginService),
    LazySingleton(classType: RegisterService),
    LazySingleton(classType: OtpService),
    LazySingleton(classType: LocationService),
    LazySingleton(classType: RecoveryadressService),
    LazySingleton(classType: DestinationadressService),
    LazySingleton(classType: CoursesinformationService),
    LazySingleton(classType: BillingoptionsService),
    LazySingleton(classType: DeliveryfinalizationService),
    LazySingleton(classType: ExpressdeliveryService),
    LazySingleton(classType: CardlistService),
    LazySingleton(classType: CardcreateService),
    LazySingleton(classType: NumlistService),
    LazySingleton(classType: NumcreateService),

    LazySingleton(classType: DestinationinfoService),
    LazySingleton(classType: ShippingproposalService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
