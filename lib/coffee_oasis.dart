import 'package:coffee_oasis/Core/Routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


enum Flavor { user, owner, delivery, staff }

class CoffeeOasis extends StatelessWidget {
  const CoffeeOasis({super.key, required this.flavor});

  final Flavor flavor;
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter(flavor: flavor);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter.router,
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        );
      },
    );
  }
}
