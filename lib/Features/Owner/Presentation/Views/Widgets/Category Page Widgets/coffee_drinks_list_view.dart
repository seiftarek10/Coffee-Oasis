import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/coffee_drink_item.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/edit_coffee_form.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/swap_note.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/slide_card.dart';
import 'package:flutter/material.dart';

class CoffeeDrinksListView extends StatelessWidget {
  const CoffeeDrinksListView({super.key, required this.coffeeDrinks});
  final List<CoffeeEntity> coffeeDrinks;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space.k24,
          const SwapNote(),
          Space.k24,
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: coffeeDrinks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
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
                    child:  CoffeeDrinkItem(
                      coffeeEntity: coffeeDrinks[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
