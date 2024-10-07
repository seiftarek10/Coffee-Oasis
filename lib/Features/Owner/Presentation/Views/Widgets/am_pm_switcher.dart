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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ToggleButtons(
        borderRadius: BorderRadius.circular(30),
        fillColor: Colors.brown,
        selectedColor: Colors.white,
        color: Colors.brown,
        borderColor: Colors.brown.withOpacity(0.7),
        selectedBorderColor: Colors.brown,
        borderWidth: 2,
        isSelected: [selectedValue == "AM", selectedValue == "PM"],
        onPressed: (int index) {
          setState(() {
            selectedValue = index == 0 ? "AM" : "PM";
          });
          widget.onSelectionChanged(selectedValue);
        },
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text('AM', style: TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text('PM', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
