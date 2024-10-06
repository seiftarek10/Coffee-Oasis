import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: Container(
        decoration: const BoxDecoration(
        color: Color.fromARGB(255, 58, 38, 28),
          image: DecorationImage(
            image: AssetImage(Assets.imagesSplash),
            
          )
        ),
      ),
    );
  }
}