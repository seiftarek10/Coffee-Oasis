import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({
    super.key,
  });

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  List<Widget> pages = <Widget>[
    const Center(
        child:
            Text('Home', style: TextStyle(fontSize: 50, color: Colors.white))),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                    _selectedIndex = 0;
                    });
                  },
                  child: const CircleAvatar(
                    backgroundColor: AppColors.kLightPrimaryColor,
                    radius: 23,
                    child: Icon(Icons.home,size: 30, color: Colors.white,))),
              GestureDetector(
                onTap: () {
                    setState(() {
                    _selectedIndex = 1;
                    });
                  },
                child: Container(
                padding: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius:  BorderRadius.circular(80)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     const CircleAvatar(
                      backgroundColor: AppColors.kPrimaryColor,
                      radius: 23,
                      child: Icon(Icons.home,size: 30, color: Colors.white,)),
                      const SizedBox(width: 8),
                      Text('Analysis',style: Fonts.font14_400PrimaryColor,),
                    ],
                  ),
                )),
             
            ],
          )),
      resizeToAvoidBottomInset: false,

      body:
          Stack(children: [Background(child: pages.elementAt(_selectedIndex))]),

      //   bottomNavigationBar:
    );
    // );
  }
}
