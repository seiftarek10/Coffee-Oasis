import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class AppEmptyWidget extends StatelessWidget {
  const AppEmptyWidget({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: MediaQuery.sizeOf(context).height * height),
        child: Center(child: Text('Empty', style: Fonts.font40_700White)));
  }
}
