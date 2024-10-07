import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Core/Widgets/navigation_bar_item.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/owner_home.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OwnerBottomBar extends StatefulWidget {
  const OwnerBottomBar({
    super.key,
  });

  @override
  State<OwnerBottomBar> createState() => _OwnerBottomBarState();
}

class _OwnerBottomBarState extends State<OwnerBottomBar> {
  List<Widget> pages = <Widget>[
    const OwnerHome(),
    const Center(
        child: Text('Analysis',
            style: TextStyle(fontSize: 50, color: Colors.white))),
    const Center(
        child: Text('Profile',
            style: TextStyle(fontSize: 50, color: Colors.white))),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
          height: 55.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Expanded(
                  child: NavigationBarItem(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      title: 'Home',
                      icon: Icons.home,
                      isActive: _selectedIndex == 0),
                ),
                Expanded(
                  child: NavigationBarItem(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      title: 'Analysis',
                      icon: Icons.analytics,
                      isActive: _selectedIndex == 1),
                ),
                Expanded(
                  child: NavigationBarItem(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      },
                      title: 'Coffee',
                      icon: Icons.coffee,
                      isActive: _selectedIndex == 2),
                )
              ],
            ),
          )),
      resizeToAvoidBottomInset: false,
      body:
          Stack(children: [Background(child: pages.elementAt(_selectedIndex))]),

      //   bottomNavigationBar:
    );
    // );
  }
}
