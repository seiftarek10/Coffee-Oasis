import 'package:coffee_oasis/Core/constant.dart';
import 'package:flutter/material.dart';

class SlideCard extends StatelessWidget {
  const SlideCard(
      {super.key,
      required this.itemKey,
      required this.delete,
      required this.update,
      required this.child});
  final Key itemKey;
  final void Function() delete, update;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: itemKey,
        background: Container(
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(AppConstant.kBorderRadius)),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Icon(Icons.edit, color: Colors.white),
        ),
        secondaryBackground: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(AppConstant.kBorderRadius)),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.endToStart) {
            delete();
          } else if (direction == DismissDirection.startToEnd) {
            update();
            return false;
          }
          return false;
        },
        child: child);
  }
}
