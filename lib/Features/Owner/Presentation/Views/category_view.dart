import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Widgets/app_bar.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/coffee_drinks_list_view.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/swap_note.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Space.topPageSpace,
                const HeaderBar(
                  headerText: 'Lettee',
                ),
                Space.k24,
                const SwapNote(),
                Space.k12,
               const CoffeeDrinksListView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

