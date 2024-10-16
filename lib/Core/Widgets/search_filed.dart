import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      cursorHeight: 25,
      style: Fonts.font16_500.copyWith(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Search coffee',
        hintStyle: Fonts.font16_500
            .copyWith(color: const Color(0xff939393)),
        fillColor: const Color(0xff2a2a2a),
        filled: true,
        prefixIcon: Icon(
          EvaIcons.search,
          size: 25.h,
          color: Colors.white,
        ),
        enabledBorder: borderShap(),
        focusedBorder: borderShap(),
      ),
    );
  }
    InputBorder borderShap() {
    return OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(20));
  }

}

