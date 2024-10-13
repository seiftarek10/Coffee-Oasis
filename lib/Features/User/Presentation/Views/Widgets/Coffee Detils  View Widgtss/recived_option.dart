import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Detils%20%20View%20Widgtss/recived_option_container.dart';
import 'package:flutter/material.dart';

class RecivedOptions extends StatefulWidget {
  const RecivedOptions({
    super.key,
  });

  @override
  State<RecivedOptions> createState() => _RecivedOptionsState();
}

class _RecivedOptionsState extends State<RecivedOptions> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Receiving Options', style: Fonts.font20_700),
        const SizedBox(height: 10),
        Row(
          children: List.generate(2, (index) {
            return Expanded(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: RecivingOptionContainer(
                      index: index, isSelected: index == _selectedIndex)),
            );
          }),
        )
      ],
    );
  }
}
