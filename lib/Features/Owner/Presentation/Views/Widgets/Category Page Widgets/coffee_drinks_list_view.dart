
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/coffee_drink_slidable_item.dart';
import 'package:flutter/material.dart';

class CoffeeDrinksListView extends StatelessWidget {
  const CoffeeDrinksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: CoffeeDrinkSlidableItme(
              itemKey: Key(index.toString()),
            ),
          );
        },
      ),
    );
  }
}

