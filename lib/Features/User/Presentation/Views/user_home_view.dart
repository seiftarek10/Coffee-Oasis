
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/user_home_header.dart';
import 'package:flutter/material.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          flex: 3,
          child: UserHomeHeader()),

          Expanded(
          flex: 5,
          child: Container())
      ],
    );
  }
}
