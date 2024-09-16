import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:sedo_app/models/api_url.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/services/destinationinfo_service.dart';
import 'package:sedo_app/ui/common/input_component.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';
import 'package:sedo_app/ui/views/home/courier/courier_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sedo_app/app/app.locator.dart';

class DestinationadressService {
  Future bottomSheetDestinationAdress(BuildContext context, String adress,
      CourierViewModel viewModel, Function()? onTap) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      builder: (context) {
        return ChangeNotifierProvider(
          create: (context) => CourierViewModel(),
          child: DestinationAdress(
            adress: adress,
            onAdressChanged: (newAdress) {
              adress = newAdress;
              print('Updated adress: $adress');
            },
            viewModel: viewModel,
            onTap: onTap,
          ),
        );
      },
    );
  }
}

class DestinationAdress extends StatefulWidget {
  final String adress;
  final ValueChanged<String> onAdressChanged;
  final CourierViewModel viewModel;
  final Function()? onTap;

  const DestinationAdress(
      {super.key,
      required this.adress,
      required this.onAdressChanged,
      required this.viewModel,
      this.onTap});

  @override
  State<DestinationAdress> createState() => _DestinationAdressState();
}

class _DestinationAdressState extends State<DestinationAdress> {
  final TextEditingController _adressController = TextEditingController();
  String? currentAddress;
  String? sessionToken;
  List<dynamic> placeList = [];

  @override
  void initState() {
    super.initState();
    _adressController.addListener(() {
      _onChanged();
    });
  }

  void _onChanged() {
    if (sessionToken == null) {
      setState(() {
        sessionToken = uuid.v4();
      });
    }
    getSuggestion(_adressController.text);
  }

  void getSuggestion(String input) async {
    try {
      String request =
          '$basePlaceURL?input=$input&key=$googleApiKey&sessiontoken=$sessionToken';
      var response = await http.get(Uri.parse(request));
      var data = json.decode(response.body);
      if (kDebugMode) {
        print('mydata');
        print("data : $data");
      }
      if (response.statusCode == 200) {
        setState(() {
          placeList = json.decode(response.body)['predictions'];
          print("placeList : $placeList");
        });
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      print(e);
    }
  }

  void getPlaceId(String adress) async {
    String request =
        '$basePlaceDetailsURL?placeid=$placeId&key=$googleApiKey&sessiontoken=$sessionToken';
    var response = await http.get(Uri.parse(request));
    var data = json.decode(response.body);
    var result = data['result'];
    var location = data['result']['geometry']['location'];
    destinationLatitude = location['lat'];
    destinationLongitude = location['lng'];
    String name = result['name'];
    setState(() {
      currentAddress = name;
    });
    widget.onAdressChanged(name);
    widget.viewModel.setDestinationName(name);
    widget.viewModel.setDestinationLocation(
        name, destinationLatitude, destinationLongitude);
    print(
        "Latitude: $destinationLatitude, Longitude: $destinationLongitude, name $name");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) - 290,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  FaIcon(
                    Icons.location_on_sharp,
                    color: Color(0xFF8C034E),
                  ),
                  SizedBox(width: 3),
                  TextComponent(
                    "Adresse de destination",
                    fontweight: FontWeight.w700,
                    fontsize: 18,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Row(
                children: [
                  TextComponent(
                    "Lieu",
                    fontweight: FontWeight.w500,
                    fontsize: 14,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextInputField(
                height: 40,
                controller: _adressController,
                hintText: "Entrez une adresse",
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: placeList.length,
                itemBuilder: (context, index) {
                  final place = placeList[index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          final destinationAdressInfo =
                              locator<DestinationinfoService>();
                          placeId = place['place_id'];
                          getPlaceId(widget.adress);
                          if (context.mounted) {
                            Future.delayed(const Duration(seconds: 3), () {
                              if (context.mounted) {
                                mapController.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                            target: LatLng(destinationLatitude,
                                                destinationLongitude), zoom: 10)));
                                Navigator.pop(context);
                              }
                              !onTapMap
                                  ? destinationAdressInfo
                                      .bottomSheetDestinationAdressInfo(context,
                                          widget.viewModel, widget.onTap)
                                  : destinationAdressInfo
                                      .bottomSheetDestination2AdressInfo(
                                          context,
                                          widget.viewModel,
                                          widget.onTap);
                              print("adress $destinationName");
                            });
                          }
                        },
                        child: ListTile(
                          leading: SvgPicture.asset("assets/mark.svg"),
                          title: TextComponent(
                            place['description'],
                            fontsize: 14,
                            fontweight: FontWeight.w400,
                          ),
                        ),
                      ),
                      if (place != placeList.last)
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey[300],
                          indent: 24,
                          endIndent: 24,
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
