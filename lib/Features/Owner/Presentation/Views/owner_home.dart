import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:flutter/material.dart';

class OwnerHome extends StatelessWidget {
  const OwnerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60)
        ),
      ),
      body: const SafeArea(
          child: Background(
            child: SizedBox.shrink(),
          )),
    );
  }
}


