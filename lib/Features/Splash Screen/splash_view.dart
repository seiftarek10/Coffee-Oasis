import 'package:coffee_oasis/Core/Constant/value_constant.dart';
import 'package:coffee_oasis/Core/Hive%20Local%20Data%20Base/boxes_name.dart';
import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:coffee_oasis/Core/Widgets/Animation/opacity.dart';
import 'package:coffee_oasis/coffee_oasis.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key, required this.flavor});

  final Flavor flavor;

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void _navigation() {
    Future.delayed(const Duration(milliseconds: 500), () async {
      nextPage(flavor: widget.flavor);
    });
  }

  Future<void> nextPage({required Flavor flavor}) async {
    switch (flavor) {
      case Flavor.user:
        if (chenkedSignIn()) {
          GoRouter.of(context).pushReplacement(Routes.user);
        } else {
          GoRouter.of(context).pushReplacement(Routes.signin);
        }
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

  bool chenkedSignIn() {
    var box = Hive.box<String>(BoxesName.uidBox);
    String? uid = box.get(AppConstant.uidKey);
    if (uid == null) {
      return false;
    }
    return true;
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
