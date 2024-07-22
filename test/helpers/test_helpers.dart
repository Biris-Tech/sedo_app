import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sedo_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sedo_app/services/login_service.dart';
import 'package:sedo_app/services/register_service.dart';
import 'package:sedo_app/services/otp_service.dart';
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
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LoginService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<RegisterService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<OtpService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LocationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<RecoveryadressService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DestinationadressService>(
      onMissingStub: OnMissingStub.returnDefault),
  MockSpec<CoursesinformationService>(
      onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BillingoptionsService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DeliveryfinalizationService>(
      onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ExpressdeliveryService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<CardlistService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<CardcreateService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<NumlistService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<NumcreateService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<NotifiationmodelService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DestinationinfoService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ShippingproposalService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterLoginService();
  getAndRegisterRegisterService();
  getAndRegisterOtpService();
  getAndRegisterLocationService();
  getAndRegisterRecoveryadressService();
  getAndRegisterDestinationadressService();
  getAndRegisterCoursesinformationService();
  getAndRegisterBillingoptionsService();
  getAndRegisterDeliveryfinalizationService();
  getAndRegisterExpressdeliveryService();
  getAndRegisterCardlistService();
  getAndRegisterCardcreateService();
  getAndRegisterNumlistService();
  getAndRegisterNumcreateService();
  getAndRegisterNotifiationmodelService();
  getAndRegisterDestinationinfoService();
  getAndRegisterShippingproposalService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockLoginService getAndRegisterLoginService() {
  _removeRegistrationIfExists<LoginService>();
  final service = MockLoginService();
  locator.registerSingleton<LoginService>(service);
  return service;
}

MockRegisterService getAndRegisterRegisterService() {
  _removeRegistrationIfExists<RegisterService>();
  final service = MockRegisterService();
  locator.registerSingleton<RegisterService>(service);
  return service;
}

MockOtpService getAndRegisterOtpService() {
  _removeRegistrationIfExists<OtpService>();
  final service = MockOtpService();
  locator.registerSingleton<OtpService>(service);
  return service;
}

MockLocationService getAndRegisterLocationService() {
  _removeRegistrationIfExists<LocationService>();
  final service = MockLocationService();
  locator.registerSingleton<LocationService>(service);
  return service;
}

MockRecoveryadressService getAndRegisterRecoveryadressService() {
  _removeRegistrationIfExists<RecoveryadressService>();
  final service = MockRecoveryadressService();
  locator.registerSingleton<RecoveryadressService>(service);
  return service;
}

MockDestinationadressService getAndRegisterDestinationadressService() {
  _removeRegistrationIfExists<DestinationadressService>();
  final service = MockDestinationadressService();
  locator.registerSingleton<DestinationadressService>(service);
  return service;
}

MockCoursesinformationService getAndRegisterCoursesinformationService() {
  _removeRegistrationIfExists<CoursesinformationService>();
  final service = MockCoursesinformationService();
  locator.registerSingleton<CoursesinformationService>(service);
  return service;
}

MockBillingoptionsService getAndRegisterBillingoptionsService() {
  _removeRegistrationIfExists<BillingoptionsService>();
  final service = MockBillingoptionsService();
  locator.registerSingleton<BillingoptionsService>(service);
  return service;
}

MockDeliveryfinalizationService getAndRegisterDeliveryfinalizationService() {
  _removeRegistrationIfExists<DeliveryfinalizationService>();
  final service = MockDeliveryfinalizationService();
  locator.registerSingleton<DeliveryfinalizationService>(service);
  return service;
}

MockExpressdeliveryService getAndRegisterExpressdeliveryService() {
  _removeRegistrationIfExists<ExpressdeliveryService>();
  final service = MockExpressdeliveryService();
  locator.registerSingleton<ExpressdeliveryService>(service);
  return service;
}

MockCardlistService getAndRegisterCardlistService() {
  _removeRegistrationIfExists<CardlistService>();
  final service = MockCardlistService();
  locator.registerSingleton<CardlistService>(service);
  return service;
}

MockCardcreateService getAndRegisterCardcreateService() {
  _removeRegistrationIfExists<CardcreateService>();
  final service = MockCardcreateService();
  locator.registerSingleton<CardcreateService>(service);
  return service;
}

MockNumlistService getAndRegisterNumlistService() {
  _removeRegistrationIfExists<NumlistService>();
  final service = MockNumlistService();
  locator.registerSingleton<NumlistService>(service);
  return service;
}

MockNumcreateService getAndRegisterNumcreateService() {
  _removeRegistrationIfExists<NumcreateService>();
  final service = MockNumcreateService();
  locator.registerSingleton<NumcreateService>(service);
  return service;
}

MockNotifiationmodelService getAndRegisterNotifiationmodelService() {
  _removeRegistrationIfExists<NotifiationmodelService>();
  final service = MockNotifiationmodelService();
  locator.registerSingleton<NotifiationmodelService>(service);
  return service;
}

MockDestinationinfoService getAndRegisterDestinationinfoService() {
  _removeRegistrationIfExists<DestinationinfoService>();
  final service = MockDestinationinfoService();
  locator.registerSingleton<DestinationinfoService>(service);
  return service;
}

MockShippingproposalService getAndRegisterShippingproposalService() {
  _removeRegistrationIfExists<ShippingproposalService>();
  final service = MockShippingproposalService();
  locator.registerSingleton<ShippingproposalService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
