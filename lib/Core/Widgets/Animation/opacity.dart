import 'package:flutter/material.dart';

class AppAnimatedOpacity extends StatelessWidget {
  const AppAnimatedOpacity({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 300),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, childd) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
    );
  }
}
