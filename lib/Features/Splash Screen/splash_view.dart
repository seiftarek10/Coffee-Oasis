import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:coffee_oasis/Core/Widgets/Animation/opacity.dart';
import 'package:coffee_oasis/coffee_oasis.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key, required this.flavor});

  final Flavor flavor;

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void _navigation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      nextPage(widget.flavor);
    });
  }

  void nextPage(Flavor flavor) {
    switch (flavor) {
      case Flavor.user:
        GoRouter.of(context).pushReplacement(Routes.user);
        break;
      case Flavor.owner:
        GoRouter.of(context).pushReplacement(Routes.owner);
        break;
      case Flavor.delivery:
        GoRouter.of(context).pushReplacement(Routes.delivery);
        break;
      case Flavor.staff:
        GoRouter.of(context).pushReplacement(Routes.staff);
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _navigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppAnimatedOpacity(
        child: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 58, 38, 28),
              image: DecorationImage(
                image: AssetImage(Assets.imagesLogo),
              )),
        ),
      ),
    );
  }
}
