import 'package:coffee_oasis/Core/constant.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/edit_coffee_body.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/coffee_drink_item.dart';
import 'package:flutter/material.dart';

class CoffeeDrinkSlidableItme extends StatelessWidget {
  const CoffeeDrinkSlidableItme({
    super.key,
    required this.itemKey,
  });

  final Key itemKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Dismissible(
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
              } else if (direction == DismissDirection.startToEnd) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const DialogEditBody();
                    });
                return false;
              }
              return false;
            },
            child: const CoffeeDrinkItem()),
        const SizedBox(height: 12),
          
      ],
    );
  }
}
