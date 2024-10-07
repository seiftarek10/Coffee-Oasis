import 'package:coffee_oasis/Core/Helpers/space.dart';

import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/profile_header.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/shop_info.dart';
import 'package:flutter/material.dart';

class OwnerProfile extends StatelessWidget {
  const OwnerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Space.topPageSpace,
          const ProfileHeaderContainer(),
          const SizedBox(height: 40),
          const ShopInfoContainer(),
        ],
      ),
    );
  }
}
