import 'package:coffee_oasis/Core/Models/bottom_naivigation_bar_item.dart';
import 'package:coffee_oasis/Core/Widgets/Bottom%20Bar/active_bottom_bar_item.dart';
import 'package:coffee_oasis/Core/Widgets/Bottom%20Bar/in_active_bottom_bar.dart';
import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.bottomBarItemModel,
      required this.isActive,
      required this.onTap});

  final BottomBarItemModel bottomBarItemModel;
  final bool isActive;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isActive
          ? ActiveBottomBarItem(
              title: bottomBarItemModel.title,
              icon: bottomBarItemModel.icon,
            )
          : InActiveBottomBarItem(
              icon: bottomBarItemModel.icon,
            ),
    );
  }
}
