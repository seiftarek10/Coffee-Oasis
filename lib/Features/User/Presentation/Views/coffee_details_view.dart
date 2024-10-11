import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Detils%20%20View%20Widgtss/coffee_details_appbar.dart';
import 'package:flutter/material.dart';


class CoffeeDetailsView extends StatelessWidget {
  const CoffeeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CoffeeDetailsAppBar()
          ],
        ),
      ),
    );
  }
}


