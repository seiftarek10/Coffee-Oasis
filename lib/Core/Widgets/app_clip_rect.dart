import 'package:flutter/material.dart';

class AppClipReact extends StatelessWidget {
  const AppClipReact({
    super.key, required this.radiusForAll, required this.child,
  });

  final bool radiusForAll;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radiusForAll? BorderRadius.circular(15):  const BorderRadius.only(
          topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
      child: child
    );
  }
}
