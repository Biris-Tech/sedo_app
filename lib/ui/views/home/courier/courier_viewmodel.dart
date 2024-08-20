import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
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
import 'package:sedo_app/services/destinationinfo_service.dart';
import 'package:sedo_app/services/expressdelivery_service.dart';
import 'package:sedo_app/services/location_service.dart';
import 'package:sedo_app/services/numcreate_service.dart';
import 'package:sedo_app/services/numlist_service.dart';
import 'package:sedo_app/services/recoveryadress_service.dart';
import 'package:sedo_app/services/shippingproposal_service.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/app_dialog.dart';
import 'package:sedo_app/ui/common/kkiapay_component.dart';
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
  String selectedPaymentMethodName = "Espèces";
  String selectedPaymentMethodIconPath = "assets/money.svg";
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
  final _destinationAdressInfo = locator<DestinationinfoService>();
  ShippingProposal? shippingProposalDeliveryExpress;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  int mapTap = 0;
  LatLng? _startLocation;
  LatLng? _endLocation;

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
          zoom: 15.0,
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
    //markers.clear();
    final marker = Marker(
        markerId: MarkerId(name),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: name),
        icon: BitmapDescriptor.defaultMarker);
    moveCamera(marker.position);
    markers.add(marker);
    print("markers: $markers");
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
        googleApiKey: googleApiKey,
        request: PolylineRequest(
            origin: PointLatLng(markers.first.position.latitude,
                markers.first.position.longitude),
            destination: PointLatLng(markers.last.position.latitude,
                markers.last.position.longitude),
            mode: TravelMode.driving));

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

  void onMapTap(LatLng position) async {
    onTapMap = true;
    print("you tap on themap");
    print("onTapMap $onTapMap");
    if (markers.length < 2) {
      final markerId = MarkerId(DateTime.now().toString());
      Marker marker = Marker(
        markerId: markerId,
        position: position,
        infoWindow: InfoWindow(title: "New Location"),
        draggable: true,
        icon: markerIcon,
        onDragEnd: (LatLng newPosition) {
          updateMarkerPosition(markerId.value, newPosition);
        },
      );

      markers.add(marker);

      if (markers.length == 2) {
        fetchAndCreatePolyline();
      }

      if (markers.length == 1) {
        _startLocation = position;
        print("startLocation: $_startLocation");
      } else {
        _endLocation = position;
        print("endLocation: $_endLocation");
      }

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String locationName = "${place.name}, ${place.country}";
        if (markers.length == 1) {
          setRecoveryName(locationName);
          setRecoveryLocation(locationName, _startLocation!.latitude,
              _startLocation!.longitude);
        } else if (markers.length == 2) {
          setDestinationName(locationName);
          setDestinationLocation(
              locationName, _endLocation!.latitude, _endLocation!.longitude);
        }
      }

      rebuildUi();
    }
  }

  void setPaymentMethod(String name, String iconPath) {
    selectedPaymentMethodName = name;
    selectedPaymentMethodIconPath = iconPath;
    rebuildUi();
  }

  void updateMarkerPosition(String markerId, LatLng newPosition) async {
    Marker marker =
        markers.firstWhere((marker) => marker.markerId.value == markerId);
    markers.remove(marker);
    markers.add(marker.copyWith(positionParam: newPosition));
    List<Placemark> placemarks = await placemarkFromCoordinates(
        newPosition.latitude, newPosition.longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      String locationName = "${place.locality}, ${place.country}";
      if (markers.length == 1) {
        setRecoveryName(locationName);
      } else {
        setDestinationName(locationName);
      }
    }
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
      print("deliveryTime: $deliveryTime");
      _billingOptionsService.bottomSheetCourierFound(
          context,
          selectedPaymentMethodName,
          selectedPaymentMethodIconPath,
          stringToInt(shipPrice).toString(),
          stringToInt(3500.toString()).toString(),
          15, () {
       // Navigator.pop(context);
        _coursesfinalisationService.bottomSheetDeliveryFinalization(
            context,
            stringToInt(shipPrice).toString(),
            stringToInt(3100.toString()).toString(),
            10,
            25,
            "Steven DOSSOU",
            "assets/profil.jpeg",
            "Ordinateur portable",
            "Un ordinateur portable Dell XPS 13 flambant neuf attend son nouveau propriétaire ! Emballé dans un carton marron de dimensions 30x40x10cm, il ne pèse que 1,5kg. Sonnez à la porte s'il vous plaît et laissez-le devant la porte si personne ne répond. Merci d'avance !",
            selectedPaymentMethodIconPath,
            selectedPaymentMethodName,
            deliveryTime, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => kkiapay),
          );
        });
      });
    }, () {
      _billingOptionsService.bottomSheetChoosenBillingOptions(
          context,
          () {
            Navigator.pop(context);
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
          arrivalLocation: destinationName,
          title: coursesTitle,
          description: coursesDescription,
          receiverData: receiverData,
          deliveryExpress: isDeliveryExpress,
          senderData: senderData,
          duration: duration,
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

      print("arrival: $destinationAddress");

      ShippingProposal shippingProposal = ShippingProposal(
        departureLocation: recoveryAdress,
        arrivalLocation: destinationName,
        title: coursesTitle,
        description: coursesDescription,
        receiverData: receiverData,
        senderData: senderData,
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
      await getDistanceBetweenPoints(recoveryLatitude, recoveryLongitude,
          destinationLatitude, destinationLongitude, googleApiKey);
      goToCoursesInfoService(context);
    });
  }

  goToDestinationAdressInfo(BuildContext context) {
    _destinationAdressInfo.bottomSheetDestinationAdressInfo(context, this,
        () async {
      Navigator.pop(context);
      _destinationAdressInfo.closeBottomSheet();
      // await getRegionFromCoordinates(
      //     destinationLatitude, destinationLongitude, googleApiKey);
      // await getDistanceBetweenPoints(recoveryLatitude, recoveryLongitude,
      //     destinationLatitude, destinationLongitude, googleApiKey);

      goToCoursesInfoService(context);
    });
  }

  void checkNumber() {
    if (RecoverynumValueKey.isNotEmpty) allInputFull == true;
    rebuildUi();
  }

  CourierViewModel() {
    print("model ready");
    _locationService.getLocation();
    print("current: $currentLocation");
    setRecoveryName("Ma position actuelle");
    recoveryLatitude = currentLocation.latitude;
    recoveryLongitude = currentLocation.longitude;
    setRecoveryLocation(
        recoveryName, recoveryLatitude, recoveryLongitude);
    rebuildUi();
  }
}
