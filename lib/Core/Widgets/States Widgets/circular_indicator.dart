import 'package:flutter/material.dart';

class AppCircularIndicator extends StatelessWidget {
  const AppCircularIndicator({super.key, required this.height, this.color});
  final double height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.sizeOf(context).height * height,
      ),
      child: Center(
        child: CircularProgressIndicator(
          color: color ?? Colors.white,
        ),
      ),
    );
  }
}
