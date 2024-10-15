import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Widgets/Animation/opacity.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Core/Widgets/Profile/profile_header.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Profile/user_info_container.dart';

import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: AppAnimatedOpacity(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Space.topPageSpace,
              const ProfileHeaderContainer(
                title: 'Seif Tariq',
                subTitle: 'Valued Coffee Oasis Member',
              ),
              const SizedBox(height: 40),
              const UserInfoContainer()
            ],
          ),
        ),
      ),
    );
  }
}
