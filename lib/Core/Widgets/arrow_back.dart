
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArrowBackIcon extends StatelessWidget {
  const ArrowBackIcon({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios_new,
            color: Colors.white, size: 28));
  }
}
