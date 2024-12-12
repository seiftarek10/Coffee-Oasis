import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:flutter/material.dart';

class AmPmSwitcher extends StatefulWidget {
  const AmPmSwitcher({super.key, required this.onSelectionChanged});

  final Function(String) onSelectionChanged;
  @override
  // ignore: library_private_types_in_public_api
  _AmPmSwitcherState createState() => _AmPmSwitcherState();
}

class _AmPmSwitcherState extends State<AmPmSwitcher> {
  String selectedValue = "AM";

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      fillColor: AppColors.kPrimaryColor,
      selectedColor: Colors.white,
      color: Colors.white,
      selectedBorderColor: AppColors.kPrimaryColor,
      borderRadius: BorderRadius.circular(20),
      isSelected: [selectedValue == "AM", selectedValue == "PM"],
      onPressed: (int index) {
        setState(() {
          selectedValue = index == 0 ? "AM" : "PM";
        });
        widget.onSelectionChanged(selectedValue);
      },
      children: const [
        Text('AM', style: TextStyle(fontSize: 18)),
        Text('PM', style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
