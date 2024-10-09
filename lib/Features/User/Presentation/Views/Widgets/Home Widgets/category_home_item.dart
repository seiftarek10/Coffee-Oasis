import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem({
    super.key, required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
          color: isSelected==true? AppColors.kPrimaryColor:const Color.fromARGB(255, 241, 241, 241),
          borderRadius: BorderRadius.circular(10)),
      child: Text('All Coffee',
          style: Fonts.font16_500.copyWith(color: isSelected==true? Colors.white:null)),
    );
  }
}
