import 'package:coffee_oasis/Core/Models/bottom_naivigation_bar_item.dart';
import 'package:coffee_oasis/Core/Widgets/Bottom%20Bar/active_bottom_bar_item.dart';
import 'package:coffee_oasis/Core/Widgets/Bottom%20Bar/in_active_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.bottomBarItemModel,
      required this.isActive,
      required this.onTap,
      this.needRightPadding});

  final BottomBarItemModel bottomBarItemModel;
  final bool isActive;
  final void Function() onTap;
  final bool? needRightPadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isActive
          ? SizedBox(
              height: 34.h,
              child: ActiveBottomBarItem(
                title: bottomBarItemModel.title,
                icon: bottomBarItemModel.icon,
                needRightPadding: needRightPadding,
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InActiveBottomBarItem(
                icon: bottomBarItemModel.icon,
              ),
            ),
    );
  }
}
