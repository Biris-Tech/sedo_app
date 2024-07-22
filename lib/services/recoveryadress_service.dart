import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sedo_app/models/api_url.dart';
import 'package:sedo_app/ui/common/input_component.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:http/http.dart' as http;
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';
import 'package:sedo_app/ui/views/home/courier/courier_viewmodel.dart';

class RecoveryadressService {
  Future bottomSheetRecoveryAdress(
      BuildContext context, String adress, CourierViewModel viewModel) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        ),
        builder: (context) {
          return RecoveryAdress(
            adress: adress,
            onAdressChanged: (newAdress) {
              adress = newAdress; // Mettre à jour l'adresse ici
              print('Updated adress: $adress');
            },
            viewModel: viewModel, // Passez viewModel ici
          );
        });
  }
}

class RecoveryAdress extends StatefulWidget {
  final String adress;
  final ValueChanged<String> onAdressChanged;
  final CourierViewModel viewModel; // Ajoutez cette ligne

  const RecoveryAdress({
    super.key,
    required this.adress,
    required this.onAdressChanged,
    required this.viewModel, // Ajoutez cette ligne
  });

  @override
  State<RecoveryAdress> createState() => _RecoveryAdressState();
}

class _RecoveryAdressState extends State<RecoveryAdress> {
  final TextEditingController _adressController = TextEditingController();
  String? currentAddress;

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
    recoveryLatitude = location['lat'];
    recoveryLongitude = location['lng'];
    String name = result['name'];
    setState(() {
      currentAddress = name;
    });
    widget.onAdressChanged(name);
    widget.viewModel.setRecoveryName(name);
    widget.viewModel
        .setRecoveryLocation(name, recoveryLatitude, recoveryLongitude);
    print(
        "Latitude: $recoveryLatitude, Longitude: $recoveryLongitude, name $name");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) - 100,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                FaIcon(
                  Icons.location_on_sharp,
                  color: Color(0xFF00D860),
                ),
                SizedBox(width: 3),
                TextComponent(
                  "Adresse de récupération",
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
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextInputField(
              height: 40,
              controller: _adressController,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: placeList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          placeId = placeList[index]['place_id'];
                          getPlaceId(widget.adress);
                          Future.delayed(const Duration(seconds: 3), () {
                            Navigator.pop(context);
                            print("adress $recoveryName");
                          });
                          print("adress $recoveryName");
                        },
                        child: ListTile(
                          leading: SvgPicture.asset("assets/mark.svg"),
                          title: TextComponent(
                            placeList[index]['description'],
                            fontsize: 14,
                            fontweight: FontWeight.w400,
                          ),
                        ),
                      ),
                      if (index < placeList.length - 1)
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
          ),
        ],
      ),
    );
  }
}
