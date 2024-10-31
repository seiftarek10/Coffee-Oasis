import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class UserHomeCategoryItem extends StatelessWidget {
  const UserHomeCategoryItem({
    super.key,
    required this.isSelected,
    required this.categoryName,
  });

  final bool isSelected;
  final String? categoryName;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 100),
      child: AnimatedScale(
        scale: isSelected == true ? 1.06 : 0.95,
        duration: const Duration(milliseconds: 200),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          decoration: BoxDecoration(
              color: isSelected == true
                  ? AppColors.kPrimaryColor
                  : const Color.fromARGB(255, 241, 241, 241),
              borderRadius: BorderRadius.circular(10)),
          child: Text(categoryName ?? '',
              style: Fonts.font16_500
                  .copyWith(color: isSelected == true ? Colors.white : null)),
        ),
      ),
    );
  }
}
