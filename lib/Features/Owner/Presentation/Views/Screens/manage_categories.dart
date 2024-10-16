import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Widgets/app_bar.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/swap_note.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/all_categories_list_view.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/floating_button.dart';
import 'package:flutter/material.dart';

class ManageCategories extends StatelessWidget {
  const ManageCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: const ManageCategoryFloatingButton(),
        resizeToAvoidBottomInset: true,
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
                Space.k24,
                const ManageAllCategoriesListView()
              ],
            ),
          ),
        )));
  }
}
