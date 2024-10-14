import 'package:coffee_oasis/Core/Widgets/rich_header_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaffHomeHeaderText extends StatelessWidget {
  const StaffHomeHeaderText({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: RichHeaderText(   title: 'Orders',
                      subTitle: [
                        'Manage Coffee Oasis ',
                        'orders ',
                        'with real-time updates for ',
                        'smooth service'
                      ],),
        ),
        const SizedBox(width: 16),
        IconButton(
            onPressed: () {},
            icon: Icon(EvaIcons.search, color: Colors.white, size: 32.h))
      ],
    );
  }
}
