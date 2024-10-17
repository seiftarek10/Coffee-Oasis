import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/coffee_drink_item.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/edit_coffee_form.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/slide_card.dart';
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
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SlideCard(
              delete: () {},
              update: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const EditCoffeeDrinkForm();
                    });
              },
              itemKey: Key(index.toString()),
              child: const CoffeeDrinkItem(),
            ),
          );
        },
      ),
    );
  }
}
