import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/button_component.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';

class CardlistService {
  Future bottomSheetCardList(BuildContext context, final Function() addCard,
      final Function()? cardConfirm) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      builder: (BuildContext context) => CardListView(
        addCard: addCard,
        cardConfirm: cardConfirm,
      ),
    );
  }
}

class CardListView extends StatefulWidget {
  final Function() addCard;
  final Function()? cardConfirm;

  const CardListView(
      {super.key, required this.addCard, required this.cardConfirm});

  @override
  _CardListViewState createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) - 70,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 4),
                const TextComponent(
                  "Mes cartes",
                  fontsize: 16,
                  fontweight: FontWeight.w700,
                  textcolor: kcDarkGreyColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                if (bankCard.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SvgPicture.asset("assets/creditCard.svg"),
                  ),
                Expanded(
                  child: bankCard.isEmpty
                      ? Center(
                          child: SvgPicture.asset("assets/nocard.svg"),
                        )
                      : ListView.builder(
                          itemCount: bankCard.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  height: 58.64,
                                  //padding: const EdgeInsets.only(bottom: 12),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF2F2F2),
                                    borderRadius: BorderRadius.circular(24.0),
                                    border: Border.all(
                                      color: selectedIndex == index
                                          ? kcPrimaryColor.withOpacity(0.5)
                                          : Colors.transparent,
                                      width: 1.5,
                                    ),
                                    boxShadow: const [],
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: ListTile(
                                        leading: SvgPicture.asset(
                                          'assets/logos_mastercard.svg',
                                          width: 50.0,
                                        ),
                                        title: TextComponent(
                                          '06•• ••• ••• •••',
                                          textcolor: selectedIndex == index
                                              ? const Color(0xFF4E022C)
                                              : const Color(0xFF6F757B),
                                          fontsize: 18,
                                          fontweight: FontWeight.w400,
                                        ),
                                        trailing: TextComponent(
                                          'MM/YY',
                                          textcolor: selectedIndex == index
                                              ? const Color(0xFF4E022C)
                                              : const Color(0xFF6F757B),
                                          fontsize: 16,
                                          fontweight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                          },
                        ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 28, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonTrueComponent(
                  height: 40,
                  width: 144,
                  "Ajouter une carte",
                  onPressed: widget.addCard,
                ),
                InkWell(
                  onTap: widget.cardConfirm,
                  child: buttonSimple(40, 159, "Confirmer"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
