// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/billingoptions_service.dart';
import '../services/cardcreate_service.dart';
import '../services/cardlist_service.dart';
import '../services/coursesinformation_service.dart';
import '../services/deliveryfinalization_service.dart';
import '../services/destinationadress_service.dart';
import '../services/destinationinfo_service.dart';
import '../services/expressdelivery_service.dart';
import '../services/location_service.dart';
import '../services/login_service.dart';
import '../services/numcreate_service.dart';
import '../services/numlist_service.dart';
import '../services/otp_service.dart';
import '../services/recoveryadress_service.dart';
import '../services/register_service.dart';
import '../services/shippingproposal_service.dart';
import '../services/tokensession_service.dart';
import '../services/uidstorage_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => RegisterService());
  locator.registerLazySingleton(() => OtpService());
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => RecoveryadressService());
  locator.registerLazySingleton(() => DestinationadressService());
  locator.registerLazySingleton(() => CoursesinformationService());
  locator.registerLazySingleton(() => BillingoptionsService());
  locator.registerLazySingleton(() => DeliveryfinalizationService());
  locator.registerLazySingleton(() => ExpressdeliveryService());
  locator.registerLazySingleton(() => CardlistService());
  locator.registerLazySingleton(() => CardcreateService());
  locator.registerLazySingleton(() => NumlistService());
  locator.registerLazySingleton(() => NumcreateService());
  locator.registerLazySingleton(() => DestinationinfoService());
  locator.registerLazySingleton(() => ShippingproposalService());
  locator.registerLazySingleton(() => TokensessionService());
  locator.registerLazySingleton(() => UidstorageService());
}
