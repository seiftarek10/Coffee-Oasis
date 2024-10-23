
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SingleChildScrollView(
        child: Skeletonizer(
            enabled: true,
            child: Column(
              children: List.generate(7, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: child
                );
              }),
            )),
      ),
    );
  }
}
