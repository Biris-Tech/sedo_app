import 'package:flutter/material.dart';
import 'package:sedo_app/models/constants.dart';

class DeliveryExpressCard extends StatelessWidget {
  final String option;
  final String selectedOption;
  final Function(String) onSelected;

  const DeliveryExpressCard({
    super.key,
    required this.option,
    required this.selectedOption,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedOption == option;
    return GestureDetector(
      onTap: () {
        onSelected(option);
        deliveryTime = option;
        print("delivery: $option");
      },
      child: Container(
        height: 36,
        width: 83.75,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF8C034E).withOpacity(0.4)
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFF8C034E).withOpacity(0.4),
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            option,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
