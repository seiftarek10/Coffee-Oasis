import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:flutter/material.dart';

class OwnerHome extends StatelessWidget {
  const OwnerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Background()),
    );
  }
}


