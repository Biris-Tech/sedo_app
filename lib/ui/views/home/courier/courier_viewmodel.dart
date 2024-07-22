import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/models/receiverdata.dart';
import 'package:sedo_app/models/senderdata.dart';
import 'package:sedo_app/models/shippingproposal.dart';
import 'package:sedo_app/services/billingoptions_service.dart';
import 'package:sedo_app/services/cardcreate_service.dart';
import 'package:sedo_app/services/cardlist_service.dart';
import 'package:sedo_app/services/coursesinformation_service.dart';
import 'package:sedo_app/services/deliveryfinalization_service.dart';
import 'package:sedo_app/services/destinationadress_service.dart';
import 'package:sedo_app/services/expressdelivery_service.dart';
import 'package:sedo_app/services/location_service.dart';
import 'package:sedo_app/services/numcreate_service.dart';
import 'package:sedo_app/services/numlist_service.dart';
import 'package:sedo_app/services/recoveryadress_service.dart';
import 'package:sedo_app/services/shippingproposal_service.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/app_dialog.dart';
import 'package:sedo_app/ui/common/location_function.dart';
import 'package:sedo_app/ui/views/home/courier/courier_view.form.dart';
import 'package:sedo_app/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';

class CourierViewModel extends BaseViewModel {
  String destinationAddress = "";
  String recoveryAdress = "Cotonou";
  String destinationService = "Akpakpa";
  String markerEnd = "assets/MapEnd.png";
  String markerStart = "assets/MapStart.png";
  String selectedPaymentMethodName = "";
  String selectedPaymentMethodIconPath = "";
  String _recoveryName = '';
  String _destinationName = '';
  String get recoveryName => _recoveryName;
  String get destinationName => _destinationName;
  final bool _allInputFull = true;
  bool isDone = false;
  bool isContainerVisible = true;
  bool isEspeceTap = false;
  bool isMomoTap = false;
  bool isCardTap = false;
  bool isDeliveryExpressTap = false;
  bool get allInputFull => _allInputFull;
  final _locationService = locator<LocationService>();
  final _recoveryService = locator<RecoveryadressService>();
  final _destinationService = locator<DestinationadressService>();
  final _coursesInfoSrvice = locator<CoursesinformationService>();
  final _billingOptionsService = locator<BillingoptionsService>();
  final _coursesfinalisationService = locator<DeliveryfinalizationService>();
  final _expressDeliveryService = locator<ExpressdeliveryService>();
  final _cardCreateService = locator<CardcreateService>();
  final _cardListService = locator<CardlistService>();
  final _numberCreateService = locator<NumcreateService>();
  final _numberListService = locator<NumlistService>();
  final _shippingCreateService = locator<ShippingproposalService>();
  ShippingProposal? shippingProposalDeliveryExpress;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  int mapTap = 0;

  void onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    print("locate1 $currentLocation");
    await _locationService.getLocation();
    print("locate $currentLocation");
  }

  void moveCamera(LatLng position) {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: position,
          zoom: 15.0, // Adjust zoom level as needed
        ),
      ),
    );
  }

  void onTapIncrement() {
    mapTap++;
    print("maptap $mapTap");
    addCustomIcon();
  }

  void setRecoveryName(String name) {
    _recoveryName = name;
    print("name: $_recoveryName");
    rebuildUi();
  }

  void setDestinationName(String name) {
    _destinationName = name;
    print("name: $_destinationName");
    rebuildUi();
  }

  Future<void> fetchAndCreatePolyline() async {
    List<LatLng> polylineCoordinates = await getPolylinePoints();
    if (polylineCoordinates.isNotEmpty) {
      final polyline = Polyline(
        polylineId: PolylineId(DateTime.now().toString()),
        color: kcPrimaryColor,
        points: polylineCoordinates,
      );
      polylines.add(polyline);
      notifyListeners();
    }
  }

  void setRecoveryLocation(String name, double latitude, double longitude) {
    final marker = Marker(
        markerId: MarkerId(name),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: name),
        icon: BitmapDescriptor.defaultMarker);
      moveCamera(marker.position);
    markers.add(marker);
    print("markers: $markers");
    if (markers.length == 2) {
      fetchAndCreatePolyline();
    }
    rebuildUi();
  }

  void setDestinationLocation(String name, double latitude, double longitude) {
    final marker = Marker(
        markerId: MarkerId(name),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: name),
        icon: BitmapDescriptor.defaultMarker);
    moveCamera(marker.position);
    markers.add(marker);
    if (markers.length == 2) {
      fetchAndCreatePolyline();
    }
    rebuildUi();
  }

  void createPolyline() {
    final polyline = Polyline(
      polylineId: PolylineId(DateTime.now().toString()),
      color: kcPrimaryColor,
      points: [
        LatLng(
            markers.first.position.latitude, markers.first.position.longitude),
        LatLng(markers.last.position.latitude, markers.last.position.longitude),
      ],
    );
    polylines.add(polyline);
    rebuildUi();
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey,
        PointLatLng(
            markers.first.position.latitude, markers.first.position.longitude),
        PointLatLng(
            markers.last.position.latitude, markers.last.position.longitude),
        travelMode: TravelMode.driving);
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }

  void addCustomIcon() {
    ImageConfiguration imageConfiguration =
        const ImageConfiguration(size: Size(40, 35));
    String selectedMarker = markerStart;
    if (mapTap == 1) {
      print("selectedmar $selectedMarker");
      selectedMarker = markerStart;
      rebuildUi();
    } else if (mapTap == 2) {
      selectedMarker = markerEnd;
      rebuildUi();
    }

    BitmapDescriptor.fromAssetImage(imageConfiguration, selectedMarker).then(
      (icon) {
        markerIcon = icon;
        rebuildUi();
      },
    );
  }

  void setPaymentMethod(String name, String iconPath) {
    selectedPaymentMethodName = name;
    selectedPaymentMethodIconPath = iconPath;
    rebuildUi();
  }

  void updateMarkerPosition(String markerId, LatLng newPosition) {
    Marker marker =
        markers.firstWhere((marker) => marker.markerId.value == markerId);
    markers.remove(marker);
    markers.add(marker.copyWith(positionParam: newPosition));
    rebuildUi();
  }

  void stateUpdate() {
    isContainerVisible = false;
    rebuildUi();
  }

  getRecoveryService(BuildContext context) {
    _recoveryService.bottomSheetRecoveryAdress(context, recoveryAdress, this);
  }

  showBillingOptions(BuildContext context) {
    _billingOptionsService.bottomSheetBillingOptions(context, () {
      Navigator.pop(context);
    }, () {
      _billingOptionsService.bottomSheetChoosenBillingOptions(
          context,
          () {
            Navigator.pop(context);
            _billingOptionsService.bottomSheetCourierFound(
                context,
                selectedPaymentMethodName,
                selectedPaymentMethodIconPath,
                2000,
                3500,
                15, () {
              Navigator.pop(context);
              _coursesfinalisationService.bottomSheetDeliveryFinalization(
                  context,
                  2000,
                  3100,
                  10,
                  25,
                  "Steven DOSSOU",
                  "assets/profil.jpeg",
                  "Ordinateur portable",
                  "Un ordinateur portable Dell XPS 13 flambant neuf attend son nouveau propriétaire ! Emballé dans un carton marron de dimensions 30x40x10cm, il ne pèse que 1,5kg. Sonnez à la porte s'il vous plaît et laissez-le devant la porte si personne ne répond. Merci d'avance !",
                  selectedPaymentMethodIconPath,
                  selectedPaymentMethodName,
                  deliveryTime, () {
                showCustomDialog(context,
                    title: "Super !!",
                    description:
                        "Votre course est validee. Le livreur sera la d’ici quelques minutes.",
                    buttonText: "Retourner a l'ecran d'accueil", onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeView()),
                  );
                });
              });
            });
          },
          () => setPaymentMethod("Espèces", "assets/money.svg"),
          () {
            setPaymentMethod("MTN, MOOV, Orange", "assets/iPhone.svg");
            _numberListService.bottomSheetnumList(context, () {
              _numberCreateService.bottomSheetNumCreate(context, () {}, () {
                Navigator.pop(context);
              });
            }, () {
              Navigator.pop(context);
            });
          },
          () {
            setPaymentMethod("Carte bancaire", "assets/Card.svg");
            _cardListService.bottomSheetCardList(context, () {
              _cardCreateService.bottomSheetCardCreate(context, () {
                Navigator.pop(context);
              }, () {});
            }, () {
              Navigator.pop(context);
            });
          });
    });
  }

  Future<void> createCourses(
      ShippingProposal courses, BuildContext context) async {
    setBusy(true);
    try {
      await _shippingCreateService.createShippingProposal(courses, context);
      rebuildUi();
    } catch (e) {
      print("Error: $e");
    } finally {
      setBusy(false);
    }
  }

  goToCoursesInfoService(BuildContext context) {
    _coursesInfoSrvice.bottomSheetCoursesInfo(context, () async {
      isDeliveryExpress = true;
      _expressDeliveryService.bottomSheetExpressDelivery(context, () async {
        print("dfezffds");
        isDeliveryExpress = true;
        ReceiverData receiverData = ReceiverData(
          latitude: recoveryLatitude,
          longitude: recoveryLongitude,
          phone: recoveryPhone,
        );
        SenderData senderData = SenderData(
          latitude: destinationLatitude,
          longitude: destinationLongitude,
          phone: destinationPhone.substring(4),
        );
        shippingProposalDeliveryExpress = ShippingProposal(
            departureLocation: recoveryAdress,
            arrivalLocation: destinationAddress,
            title: coursesTitle,
            description: coursesDescription,
            receiverData: receiverData,
            deliveryExpress: isDeliveryExpress,
            senderData: senderData,
            duration: duration,
            region: region,
            distance: distance,
            amount: shipPrice,
            );
        print("shipping: ${shippingProposalDeliveryExpress!.toJson()}");
        Navigator.pop(context);
      });
    }, () async {
      ReceiverData receiverData = ReceiverData(
        latitude: recoveryLatitude,
        longitude: recoveryLongitude,
        phone: recoveryPhone,
      );
      SenderData senderData = SenderData(
        latitude: destinationLatitude,
        longitude: destinationLongitude,
        phone: destinationPhone.substring(4),
      );

      ShippingProposal shippingProposal = ShippingProposal(
          departureLocation: recoveryAdress,
          arrivalLocation: destinationAddress,
          title: coursesTitle,
          description: coursesDescription,
          receiverData: receiverData,
          senderData: senderData,
          region: region,
          distance: distance,
          amount: shipPrice,
      );

      print("shipping: ${shippingProposal.toJson()}");
      print("recei: ${receiverData.toJson()}");
      print("sender: ${senderData.toJson()}");
      !isDeliveryExpress
          ? await createCourses(shippingProposal, context)
          : await createCourses(shippingProposalDeliveryExpress!, context);
    });
  }

  goToDestinationService(BuildContext context) {
    _destinationService.bottomSheetDestinationAdress(
        context, destinationAddress, this, () async {
      Navigator.pop(context);
      await getRegionFromCoordinates(
          destinationLatitude, destinationLongitude, googleApiKey);
      await getDistanceBetweenPoints(recoveryLatitude, recoveryLongitude,
          destinationLatitude, destinationLongitude, googleApiKey);
      goToCoursesInfoService(context);
    });
  }

  void checkNumber() {
    if (RecoverynumValueKey.isNotEmpty) allInputFull == true;
    rebuildUi();
  }
}
