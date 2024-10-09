import 'package:coffee_oasis/Core/Models/bottom_naivigation_bar_item.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Core/Widgets/Bottom%20Bar/navigation_bar_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({
    super.key,
    required this.pages,
    required this.bottomBarItmeModel, required this.useBackGround,
  });

  final List<Widget> pages;
  final List<BottomBarItemModel> bottomBarItmeModel;
  final bool useBackGround;

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SizedBox(
          height: 55.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
                children: widget.bottomBarItmeModel.asMap().entries.map((e) {
              return Expanded(
                child: NavigationBarItem(
                    onTap: () {
                      setState(() {
                        _selectedIndex = e.key;
                      });
                    },
                    bottomBarItemModel: e.value,
                    isActive: _selectedIndex == e.key),
              );
            }).toList()),
          )),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: widget.useBackGround==true?
        
         Stack(children: [
          Background(child: widget.pages.elementAt(_selectedIndex))
        ]):widget.pages.elementAt(_selectedIndex
      )),

      //   bottomNavigationBar:
    );
    // );
  }
}
