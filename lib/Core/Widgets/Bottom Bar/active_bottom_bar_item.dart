import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class ActiveBottomBarItem extends StatelessWidget {
  const ActiveBottomBarItem({
    super.key, required this.title, required this.icon,
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
             child: CircleAvatar(
                backgroundColor: AppColors.kPrimaryColor,
                radius: 23,
                child: Icon(
                  icon,
                  size: 30,
                  color: Colors.white,
                )),
           ),
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: Fonts.font14_400PrimaryColor,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
