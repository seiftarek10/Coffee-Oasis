import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Widgets/app_bar.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/floating_action_button.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/coffee_drinks_list_view.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/swap_note.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.categoryEntity});

  final CategoryEntity categoryEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:  AddFloatingActionButton(
        id: categoryEntity.id!,
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Space.topPageSpace,
                 HeaderBar(
                  headerText: categoryEntity.name??'No Name',
                ),
                Space.k24,
                const SwapNote(),
                Space.k24,
                const CoffeeDrinksListView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
