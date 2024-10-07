import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void _navigation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        GoRouter.of(context).pushReplacement(Routes.owner);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _navigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 58, 38, 28),
            image: DecorationImage(
              image: AssetImage(Assets.imagesSplash),
            )),
      ),
    );
  }
}
