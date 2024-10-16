import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/Bottom%20Bar/animated_icon.dart';
import 'package:flutter/material.dart';

class ActiveBottomBarItem extends StatelessWidget {
  const ActiveBottomBarItem({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(80)),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: AnimtaedCircleAvatar(icon: icon),
          ),
          const SizedBox(width: 4),
          Expanded(
            flex: 5,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: Fonts.font14_500PrimaryColor,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



