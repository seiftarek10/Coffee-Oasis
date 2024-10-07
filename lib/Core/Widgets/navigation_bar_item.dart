import 'package:coffee_oasis/Core/Widgets/active_bottom_bar_item.dart';
import 'package:coffee_oasis/Core/Widgets/in_active_bottom_bar.dart';
import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.isActive, required this.onTap});

  final String title;
  final IconData icon;
  final bool isActive;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:  isActive
        ? ActiveBottomBarItem(
            title: title,
            icon: icon,
          )
        : InActiveBottomBarItem(
            icon: icon,
          ),
    );
    
  }
}
