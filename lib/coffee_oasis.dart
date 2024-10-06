import 'package:coffee_oasis/Core/Routes/app_router.dart';
import 'package:flutter/material.dart';

class CoffeeOasis extends StatelessWidget {
  const CoffeeOasis({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}