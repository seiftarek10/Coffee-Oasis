import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.labelText,
    required this.onSaved,
    this.suffixIcon, required this.validator,  this.keyboardType,
  });

  final String labelText;
  final TextInputType? keyboardType;
  final void Function(String?) onSaved;
  final String Function(String?) validator;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(57, 0, 0, 0),
        child: TextFormField(
        
          validator: validator,
          onSaved: onSaved,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboardType,
          cursorColor: AppColors.kPrimaryColor,
          cursorHeight: 20.h,
          style: Fonts.font20_700.copyWith(color: Colors.white),
          decoration: InputDecoration(
              labelText: labelText,
              suffixIcon: suffixIcon,
              labelStyle: Fonts.font18_700.copyWith(color: Colors.white),
              fillColor: Colors.transparent,
              filled: true,
              enabledBorder:
                  borderStyle(color: AppColors.kWhiteObacity, width: 2),
              focusedBorder:
                  borderStyle(width: 2, color: AppColors.kPrimaryColor)),
        ));
  }
}

OutlineInputBorder borderStyle({required double width, required Color color}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: width, color: color));
}
