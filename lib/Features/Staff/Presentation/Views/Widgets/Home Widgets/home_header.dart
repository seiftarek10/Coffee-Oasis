import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Widgets/rich_header_text.dart';
import 'package:coffee_oasis/Core/Widgets/search_filed.dart';
import 'package:flutter/material.dart';

class StaffHomeHeader extends StatefulWidget {
  const StaffHomeHeader({super.key});

  @override
  State<StaffHomeHeader> createState() => _StaffHomeHeaderState();
}

class _StaffHomeHeaderState extends State<StaffHomeHeader> {
  late bool searchMood;
  @override
  void initState() {
    super.initState();
    searchMood = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RichHeaderText(
            title: 'Orders',
            subTitle: [
              'Manage Coffee Oasis ',
              'orders ',
              'with real-time updates for ',
              'smooth service'
            ],
          ),
        Space.k20,
        const SearchField(),
      ],
    );
  }
}
